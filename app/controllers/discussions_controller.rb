class DiscussionsController < ApplicationController
  has_many :comments, dependent: :destroy
end
