class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :transactions, dependent: :destroy
  has_many :invoice_items, dependent: :destroy
  has_many :items, through: :invoice_items

  enum status: {
    'in progress': 0,
    cancelled: 1,
    completed: 2,
  }

  def created_at_formatted
    created_at.strftime("%A, %B %d, %Y")
  end

  def created_at_short_format
    created_at.strftime("%x")
  end

  def customer_by_id
    Customer.find(customer_id)
  end
end
