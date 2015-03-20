# RailsAdmin config file. Generated on March 17, 2015 17:32
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|


  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Dix Conseils Pour', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, 'User'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'User'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = ['Admin', 'Advice', 'Subject', 'Theme', 'User', 'Vote']

  # Include specific models (exclude the others):
  # config.included_models = ['Admin', 'Advice', 'Subject', 'Theme', 'User', 'Vote']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]


  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block

  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:



  ###  Admin  ###

  # config.model 'Admin' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your admin.rb model definition

  #   # Found associations:

  #     configure :subjects, :has_many_association
  #     configure :advices, :has_many_association

  #   # Found columns:

  #     configure :id, :integer
  #     configure :email, :string
  #     configure :password, :password         # Hidden
  #     configure :password_confirmation, :password         # Hidden
  #     configure :reset_password_token, :string         # Hidden
  #     configure :reset_password_sent_at, :datetime
  #     configure :remember_created_at, :datetime
  #     configure :sign_in_count, :integer
  #     configure :current_sign_in_at, :datetime
  #     configure :last_sign_in_at, :datetime
  #     configure :current_sign_in_ip, :string
  #     configure :last_sign_in_ip, :string
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime
  #     configure :gender, :string
  #     configure :lastname, :string
  #     configure :firstname, :string
  #     configure :link, :string
  #     configure :role, :string
  #     configure :website, :string
  #     configure :avatar_file_name, :string         # Hidden
  #     configure :avatar_content_type, :string         # Hidden
  #     configure :avatar_file_size, :integer         # Hidden
  #     configure :avatar_updated_at, :datetime         # Hidden
  #     configure :avatar, :paperclip
  #     configure :type, :string
  #     configure :birthdate, :date
  #     configure :town, :string
  #     configure :job, :string
  #     configure :biography, :text

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Advice  ###

  # config.model 'Advice' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your advice.rb model definition

  #   # Found associations:

  #     configure :subject, :belongs_to_association
  #     configure :user, :belongs_to_association
  #     configure :votes, :has_many_association

  #   # Found columns:

  #     configure :id, :integer
  #     configure :title, :string
  #     configure :description, :text
  #     configure :subject_id, :integer         # Hidden
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime
  #     configure :user_id, :integer         # Hidden
  #     configure :state, :string

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Subject  ###

  config.model 'Subject' do

    # You can copy this to a 'rails_admin do ... end' block inside your subject.rb model definition

    # Found associations:

      configure :user, :belongs_to_association
      configure :theme, :belongs_to_association
      configure :advices, :has_many_association

    # Found columns:

      configure :id, :integer
      configure :title, :string
      configure :description, :text
      configure :created_at, :datetime
      configure :updated_at, :datetime
      configure :user_id, :integer         # Hidden
      configure :theme_id, :integer         # Hidden
      configure :illustration_file_name, :string         # Hidden
      configure :illustration_content_type, :string         # Hidden
      configure :illustration_file_size, :integer         # Hidden
      configure :illustration_updated_at, :datetime         # Hidden
      configure :illustration, :paperclip
      configure :state, :string

    # Cross-section configuration:

      # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
      # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
      # label_plural 'My models'      # Same, plural
      # weight 0                      # Navigation priority. Bigger is higher.
      # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
      # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

    # Section specific configuration:

      list do
        # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
        # items_per_page 100    # Override default_items_per_page
        # sort_by :id           # Sort column (default is primary key)
        # sort_reverse true     # Sort direction (default is true for primary key, last created first)
      end
      show do; end
      edit do
        field :title
        field :description
        field :theme
        field :user
      end
      export do; end
      # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
      # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
      # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  Theme  ###

  # config.model 'Theme' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your theme.rb model definition

  #   # Found associations:

  #     configure :theme, :belongs_to_association
  #     configure :subjects, :has_many_association
  #     configure :themes, :has_many_association

  #   # Found columns:

  #     configure :id, :integer
  #     configure :title, :string
  #     configure :description, :text
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime
  #     configure :color, :string
  #     configure :icon_file_name, :string         # Hidden
  #     configure :icon_content_type, :string         # Hidden
  #     configure :icon_file_size, :integer         # Hidden
  #     configure :icon_updated_at, :datetime         # Hidden
  #     configure :icon, :paperclip
  #     configure :theme_id, :integer         # Hidden

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  User  ###

  # config.model 'User' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your user.rb model definition

  #   # Found associations:

  #     configure :subjects, :has_many_association
  #     configure :advices, :has_many_association

  #   # Found columns:

  #     configure :id, :integer
  #     configure :email, :string
  #     configure :password, :password         # Hidden
  #     configure :password_confirmation, :password         # Hidden
  #     configure :reset_password_token, :string         # Hidden
  #     configure :reset_password_sent_at, :datetime
  #     configure :remember_created_at, :datetime
  #     configure :sign_in_count, :integer
  #     configure :current_sign_in_at, :datetime
  #     configure :last_sign_in_at, :datetime
  #     configure :current_sign_in_ip, :string
  #     configure :last_sign_in_ip, :string
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime
  #     configure :gender, :string
  #     configure :lastname, :string
  #     configure :firstname, :string
  #     configure :link, :string
  #     configure :role, :string
  #     configure :website, :string
  #     configure :avatar_file_name, :string         # Hidden
  #     configure :avatar_content_type, :string         # Hidden
  #     configure :avatar_file_size, :integer         # Hidden
  #     configure :avatar_updated_at, :datetime         # Hidden
  #     configure :avatar, :paperclip
  #     configure :type, :string
  #     configure :birthdate, :date
  #     configure :town, :string
  #     configure :job, :string
  #     configure :biography, :text

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Vote  ###

  # config.model 'Vote' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your vote.rb model definition

  #   # Found associations:

  #     configure :user, :belongs_to_association
  #     configure :advice, :belongs_to_association

  #   # Found columns:

  #     configure :id, :integer
  #     configure :user_id, :integer         # Hidden
  #     configure :advice_id, :integer         # Hidden
  #     configure :is_good, :boolean
  #     configure :ip, :string
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end

end
