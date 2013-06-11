# encoding: utf-8
# == Schema Information
#
# Table name: contracts
#
#  id             :integer          not null, primary key
#  status         :integer
#  number         :string(255)
#  subject        :text
#  tax_year       :integer
#  description    :text
#  deadline_date  :date
#  end_date       :date
#  archiving      :text
#  role_type      :string(255)
#  price_type     :string(255)
#  invoicing_note :text
#  note           :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

# author: mbach

# atributy:
#
# status() - stav
# number() - číslo
# subject() - věc
# tax_year() - rok
# description() - popis
# deadline_date() - termín
# end_date() - datum ukončení
# archiving() - archivuje
# role_type() - CDV je v pozici
# price_type() - celková částka
# invoicing_note() - označení fakturace
# note() - poznámka

class Contract < ActiveRecord::Base

  ROLE_TYPES =
  {
       customer: 'odběratel / objednatel',
       provider: 'zhotovitel / dodavatel',
    coordinator: 'koordinátor',
           none: 'smlouva nemá obchodní charakter'
  }

  PRICE_TYPES = 
  {
    less: 'méně než 250 000 Kč',
    more: '250 000 Kč a více'
  }

  attr_protected(:created_at,:updated_at)

  validates(:status,{presence: true})
  validates(:number,{presence: true})
  validates(:subject,{presence: true})
  validates(:tax_year,{presence: true,format: {with: /(19|20)\d{2}/i }})
  validates(:description,{presence: true})
  validates(:deadline_date,{presence: true})
  validates(:archiving,{presence: true})
  validates(:role_type,{presence: true})
  validates(:price_type,{presence: true})

  validate(:validate_role_type)
  validate(:validate_price_type)

  def validate_role_type()
    ok = ((!role_type().blank?()) and ROLE_TYPES.has_key?(role_type().to_sym()))
    if(!ok)
      errors().add(:role_type,'Toto pole nemůže nabývat hodnot jiných než hodnot číselníku')
    end
  end

  def validate_price_type()
    ok = ((!price_type().blank?()) and PRICE_TYPES.has_key?(price_type().to_sym()))
    if(!ok)
      errors().add(:price_type,'Toto pole nemůže nabývat hodnot jiných než hodnot číselníku')
    end
  end

end
