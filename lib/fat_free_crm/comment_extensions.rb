# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
module FatFreeCrm
  module CommentExtensions
    extend ActiveSupport::Concern

    included do
      def add_comment_by_user(comment_body, user)
        comments.create(comment: comment_body, user: user) if comment_body.present?
      end
    end

  end
end
