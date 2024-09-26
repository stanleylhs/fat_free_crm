# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
module FatFreeCrm
  module GemExt
    module ActionController
      module Base
        unless Rails.env.test?
          # Remove helpers residing in subdirectories from the list of application
          # helpers.  Basically we don't want helpers in app/helpers/admin/* to
          # override the ones in app/helpers/*.
          #----------------------------------------------------------------------------
          def self.all_application_helpers
            super.delete_if { |helper| helper.include?(File::SEPARATOR) }
          end
        end
      end
    end
  end
end

ActionController::Base.prepend FatFreeCrm::GemExt::ActionController::Base
