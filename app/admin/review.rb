ActiveAdmin.register Review do

  controller do
    belongs_to :user, :product, optional: true
  end

end
