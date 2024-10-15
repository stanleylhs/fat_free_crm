# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
module FatFreeCrm
  module CoreExt
    module NilClass
      extend ActiveSupport::Concern
      def true?
        false
      end

      def false?
        false
      end
    end
  end
end
