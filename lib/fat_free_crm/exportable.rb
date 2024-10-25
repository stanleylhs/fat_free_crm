# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
module FatFreeCrm
  module Exportable
    extend ActiveSupport::Concern

    included do
      def user_id_full_name
        user = self.user
        user ? user.full_name : ''
      end

      if instance_methods.include?(:assignee)
        define_method :assigned_to_full_name do
          user = assignee
          user ? user.full_name : ''
        end
      end

      if instance_methods.include?(:completor)
        define_method :completed_by_full_name do
          user = completor
          user ? user.full_name : ''
        end
      end

    end

  end
end
