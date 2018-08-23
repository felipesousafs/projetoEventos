class InscriptionDecorator < Draper::Decorator
  delegate_all

  def status_do_pagamento
    self.paid ? "Aprovado em #{self.paid_at}" : 'Pendente'
  end

  def cumpom_utilizado
    self.coupom ? coupom.key : 'Nenhum'
  end

  def total_value
    inscription_items.sum(:value)
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
