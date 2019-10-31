ActiveAdmin.register Patient do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, physicians_attributes: [:id, :name , :_destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  show do
    attributes_table do
      row :id
      row :name
      row :physician do |p|
        table_for p.physicians do
          column :id
          column :name
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :id , input_html: { readonly: true }
      f.input :name
    end
    f.inputs do
      f.has_many :physicians , new_record: false, allow_destroy: true do |t|
        t.input :id , input_html: { readonly: true }
        t.input :name
      end
    end
    actions
  end
end
