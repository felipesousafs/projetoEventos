class Event < ApplicationRecord
  include Filterable

  scope :contains_tags, -> (tags) do
    tagged_with(tags, any: true)
  end

  scope :published, -> do
    where(published: true)
  end

  scope :search_filter, -> (name) do
    joins(:event_items, :institutions).where(
        "events.name ILIKE ? OR events.description ILIKE ?
        OR event_items.name ILIKE ? OR event_items.description ILIKE ?
        OR institutions.name ILIKE ?",
        "%#{name}%", "%#{name}%", "%#{name}%", "%#{name}%", "%#{name}%")
  end

  scope :most_popular_top, -> (limit) do
    left_joins(:inscriptions)
        .group(:id)
        .order('COUNT(inscriptions.id) DESC')
        .limit(limit)
  end
  scope :is_not_satellite, -> do
    where('events.event_id IS NULL')
  end

  scope :has_no_satellites, -> do
    where.not(id: (where("events.event_id IS NOT NULL").pluck(:event_id)))
  end

  scope :managed_by, ->(user) do
    where(user_id: user)
  end

  scope :with_moderator, ->(user) do
    where(user_id: user)
  end

  scope :without_event, ->(event_id) do
    where.not(id: event_id)
  end


  acts_as_taggable

  has_many :moderators, :dependent => :destroy
  has_many :stages, :dependent => :destroy
  validates :name, presence: true
  validates :stages, presence: true
  validates :location, presence: true

  has_many :stages, :dependent => :destroy
  has_many :event_items, :dependent => :destroy
  has_many :partnerships, :dependent => :destroy
  has_many :institutions, through: :partnerships
  has_many :inscriptions, :dependent => :destroy
  has_many :coupoms, :dependent => :destroy
  has_one :event_item_type, through: :event_items
  belongs_to :event_type
  belongs_to :user
  belongs_to :location

  belongs_to :events, optional: true
  has_many :children, class_name: 'Event', foreign_key: 'event_id'

  accepts_nested_attributes_for :event_items, allow_destroy: true
  accepts_nested_attributes_for :stages, allow_destroy: true
  accepts_nested_attributes_for :partnerships, allow_destroy: true
  accepts_nested_attributes_for :coupoms, allow_destroy: true
  accepts_nested_attributes_for :moderators, allow_destroy: true

  validates_associated :stages
  validate :check_event_item_concomitance

  before_validation :check_event_items_location

  def add_tags(params)
    list_of_tags = params[:event][:tags_list].join(',')
    logger.info(list_of_tags)
    self.tag_list = list_of_tags
    self.save
  end

  def tags_list
    tag_list.join(',')
  end

  def parent
    if self.event_id
      Event.find(self.event_id)
    end
  end

  def publish
    self.published = true
    self.published_at = Time.current
    self.save
  end

  def children_or_parent
    if self.event_id
      Event.where(id: self.event_id)
    else
      self.children
    end
  end

  def publishment_information
    if self.published?
      "Publicado em: <span class='label label-success'>#{I18n.l(self.published_at, format: :long)}</span>".html_safe
    else
      "<span class='label label-warning'>Não publicado</span>".html_safe
    end
  end

  def check_event_items_location
    self.event_items.each do |item|
      item.check_if_location_is_present
    end
  end

  def auto_coupom
    self.coupoms.where("coupoms.expiration >= ?", Date.today).where(is_automatic: true)
  end
  def has_auto_coupom?
    auto_coupom.size > 0
  end

  def check_event_item_concomitance
    has_error = false
    items = self.event_items
    items.each do |item|
      unless item.permit_concomitance
        items.each do |it|
          if it.id != item.id
            if it.start_at.between?(item.start_at, item.end_at)
                has_error = true
            end
            if it.end_at.between?(item.start_at, item.end_at)
              has_error = true
            end
            if item.end_at.between?(it.start_at, it.end_at)
              has_error = true
            end
            if item.end_at.between?(it.start_at, it.end_at)
              has_error = true
            end
          end
        end
      end
    end
    if has_error
      errors.add("", "Conflito de horário com atividade que não permite concomitância.")
    end
  end

end
