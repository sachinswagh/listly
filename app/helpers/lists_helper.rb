module ListsHelper
  def items_are_present?(list)
  	list.list_items.exists?
  end
end
