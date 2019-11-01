require 'pry'
ActiveAdmin.register Physician do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name , patients_attributes: [:id, :name, :_destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  controller do
    def update
       params[:physician][:patients_attributes].each do |p|
         appt_obj = Appointment.find_or_initialize_by(patient_id: p[1][:id] , physician_id: resource.id)
         appt_obj.save
       end
       super
    end
    def update_name
      patient_obj = Patient.find(params[:patient_id])
      respond_to do |format|
      format.html
      format.json { render json: { "patient" => patient_obj} }
    end
    end
  end

  show do
    attributes_table do
      row :id
      row :name
      row :patient do |p|
        table_for p.patients do
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
      f.has_many :patients, allow_destroy: true do |t|
        t.input :id ,label: 'Patient_id',as: :select ,collection: Patient.all.ids
        t.input :name
      end
    end
    f.actions
  end
end
