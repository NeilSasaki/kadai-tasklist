class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :content
      #user_idを外部キーに設定
      #t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
