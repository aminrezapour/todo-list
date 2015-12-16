every 1.day, :at => '12:30 am' do
  rake "todo:delete_items"
end
