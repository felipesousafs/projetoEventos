module ApplicationHelper
  def eval_with_rescue(code)
    begin
      eval(code)
    rescue Exception => e
      "error"
    end
  end

  def display_billet_status(i, n = false, v = false)
    klass = 'primary'
    msg = i.status
    msg = "#{n}. #{msg}" if n
    msg = "#{msg} #{number_to_currency(i.value)}" if v
    klass = 'success' if i.status == 'Pago'
    klass = 'warning' if i.status == 'Em Aberto'
    klass = 'danger' if i.status == 'Vencido'
    "<span class='label label-#{klass}'>#{msg}</span>".html_safe
  end

  def display_inscription_status(i)
    "<span class='label label-#{i[:class]}'>#{i[:msg]}</span>".html_safe
  end

  def display_boolean(i, values = ['Sim', 'Não'])
    msg = i ? values[0] : values[1]
    klass = ''
    klass = 'success' if i == true
    klass = 'danger' if i == false
    i == nil ? '' : "<span class='label label-#{klass}'>#{msg}</span>".html_safe
  end

  def display_boolean_with_nil(i, values = ['Sim', 'Não', nil])
    msg = values[0] if i == true
    msg = values[1] if i == false
    msg = values[2] if i == nil
    klass = ''
    klass = 'warning' if i == nil
    klass = 'success' if i == true
    klass = 'danger' if i == false
    "<span class='label label-#{klass}'>#{msg}</span>".html_safe
  end
end
