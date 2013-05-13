# author: martinbachtikcdvcz

class ChangeDatafilesAttributes < ActiveRecord::Migration

  def up
    remove_column :datafiles, :extension
    remove_column :datafiles, :path
    rename_column :datafiles, :filename, :data_file_name
    rename_column :datafiles, :size, :data_file_size
    add_column :datafiles, :data_content_type, :string
  end

  def down
  end

end