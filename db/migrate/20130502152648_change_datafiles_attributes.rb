# author: martinbachtikcdvcz

class ChangeDatafilesAttributes < ActiveRecord::Migration

  def up
    remove_column :datafiles, :extension
    remove_column :datafiles, :path

    rename_column :datafiles, :filename, :data_file_name
    rename_column :datafiles, :size, :data_file_size

    add_column    :datafiles, :data_content_type, :string
  end

  def down
    remove_column :datafiles, :data_content_type

    rename_column :datafiles, :data_file_name, :filename
    rename_column :datafiles, :data_file_size, :size

    add_column    :datafiles, :extension, :string
    add_column    :datafiles, :path, :text
  end

end