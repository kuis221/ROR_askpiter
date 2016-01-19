ActiveAdmin.register Photo do

  controller do
    belongs_to :user, :category, :product, optional: true
  end




end
