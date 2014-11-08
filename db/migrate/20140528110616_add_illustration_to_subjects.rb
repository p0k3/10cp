class AddIllustrationToSubjects < ActiveRecord::Migration
  def change
    add_attachment :subjects, :illustration
  end
end
