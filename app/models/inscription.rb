class Inscription < ApplicationRecord
  has_many :inscription_items, dependent: :destroy
  belongs_to :event
  belongs_to :user
  belongs_to :coupom, optional: true

  has_many :event_items, through: :inscription_items

  accepts_nested_attributes_for :inscription_items, allow_destroy: true
  validates_associated :inscription_items
  validate :check_current_user_ir_not_the_owner

  def check_current_user_ir_not_the_owner
    if self.user_id == self.event.user_id
      errors.add("", "Não é possível realizar inscrição no seu próprio evento.")
    end
  end
  validates :user_id, :uniqueness => { :scope => :event_id,
                                    :message => "Voce já está inscrito nesse evento" }


  def add_event_item(ids)
    ids.each do |id|
      event_item = EventItem.find(id)
      item = self.inscription_items.new
      item.event_item = event_item
      item.name = event_item.name
      item.value = event_item.value
      #item.save
    end
  end

  def valor_sem_desconto
    inscription_items.sum(:value)
  end

  def valor_total
    if coupom
      if coupom.value > 0
        valor = valor_sem_desconto - (valor_sem_desconto * coupom.value / 100.0)
      else
        valor_sem_desconto
      end
    else
      valor_sem_desconto
    end
  end

  def status_do_pagamento
    self.paid ? "Aprovado em #{self.paid_at}" : 'Pendente'
  end

  def cumpom_utilizado
    self.coupom ? coupom.key : 'Nenhum'
  end

end
