class Order <ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip, :status

  belongs_to :user
  has_many :item_orders
  has_many :items, through: :item_orders

  def grandtotal
    item_orders.sum('price * quantity')
  end
  
  def items_count
    items.count
  end
  
  def fulfilled?
    !item_orders.pluck(:status).include?("unfulfilled")
  end
end
