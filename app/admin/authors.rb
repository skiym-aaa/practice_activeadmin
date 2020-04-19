ActiveAdmin.register Author do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    column '書籍数' do |author|
      author.books.count
    end
    column :created_at
    column :updated_at
    actions
  end

  show do |author|
    attributes_table(*author.class.columns.collect { |column| column.name.to_sym})
    panel "書籍一覧"  do
      table_for author.books do
        column :title
        column :publish_date
      end
    end
    active_admin_comments
  end
end
