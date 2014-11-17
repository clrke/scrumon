class CreateOrganizationsUsers < ActiveRecord::Migration
  def change
    create_table :organizations_users do |t|
    	t.belongs_to :organizations
    	t.belongs_to :users
    	t.boolean :admin
    end
  end
end
