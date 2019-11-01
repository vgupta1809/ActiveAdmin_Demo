ActiveAdmin.register Appointment do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :physician_id, :patient_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :physician_id, :patient_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    id_column
    column :name
    column 'Patient_id' , :patient_id do |row|
     link_to row.patient_id, admin_patient_path(row.patient_id)
   end
    column 'Physician_id' , :physician_id do |row|
      link_to row.physician_id, admin_physician_path(row.physician_id)
    end
    column :created_at
    column :updated_at
    actions
  end

end
