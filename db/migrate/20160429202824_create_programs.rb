class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.text :description
      t.integer :phote_id
      t.integer :provider_id
      t.string :website
      t.string :category
      t.integer :age_start
      t.integer :age_end
      t.text :refund_policy
      t.text :syllabus
      t.text :application_detail
      t.text :contact_info
      t.tsvector :tsv

      t.timestamps null: false
    end

    execute <<-SQL
      CREATE TRIGGER programtsvectorupdate BEFORE INSERT OR UPDATE
      ON programs FOR EACH ROW EXECUTE PROCEDURE
      tsvector_update_trigger(tsv, 'pg_catalog.english', name, description, category, syllabus, refund_policy, application_detail, contact_info);
    SQL

    execute <<-SQL
      CREATE INDEX tsv_idx_on_program ON programs USING gin(tsv);
    SQL
  end   
end
