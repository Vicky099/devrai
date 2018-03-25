class CreateHomeContents < ActiveRecord::Migration[5.1]
  def change
    create_table :home_contents do |t|
      t.text :site_header
      t.text :site_menu
      t.text :content1_header
      t.text :content1_desc
      t.text :content2_header
      t.text :content2_sub_header
      t.text :content2_desc
      t.text :content3_header
      t.text :content3_desc
      t.text :content4_header
      t.text :content4_thought1_desc
      t.text :content4_thought1_name
      t.text :content4_thought1_position
      t.text :content4_thought2_desc
      t.text :content4_thought2_name
      t.text :content4_thought2_position
      t.text :content4_thought3_desc
      t.text :content4_thought3_name
      t.text :content4_thought3_position
      t.text :content5_header
      t.text :content6_header
      t.timestamps
    end
  end
end
