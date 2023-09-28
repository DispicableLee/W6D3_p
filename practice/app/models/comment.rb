# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  artwork_id :bigint           not null
#  author_id  :bigint           not null
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
end
