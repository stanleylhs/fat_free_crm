# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------

module FatFreeCrm
  class << self
    # Return either Application or Engine,
    # depending on how Fat Free CRM has been loaded
    def application
      engine? ? Engine : Application
    end

    delegate :root, to: :application

    # Are we running as an engine?
    def engine?
      defined?(FatFreeCrm::Engine).present?
    end

    def application?
      !engine?
    end
  end
end

# Load Fat Free CRM as a Rails Engine, unless running as a Rails Application
require 'fat_free_crm/engine' unless defined?(FatFreeCrm::Application)

# Require gem dependencies, monkey patches, and vendored plugins (in lib)
require "fat_free_crm/gem_dependencies"
require "fat_free_crm/version"
require "fat_free_crm/exceptions"
require "fat_free_crm/export_csv"
require "fat_free_crm/tabs"
require "fat_free_crm/view_factory"

require "fat_free_crm/comment_extensions"
require "fat_free_crm/exportable"

require "fat_free_crm/core_ext/nil_class"
NilClass.include FatFreeCrm::CoreExt::NilClass
require "fat_free_crm/core_ext/string"
String.include FatFreeCrm::CoreExt::String

require "fat_free_crm/gem_ext/action_controller/base"
ActionController::Base.include FatFreeCrm::GemExt::ActionController::Base

require "fat_free_crm/callback"
ActionView::Base.include FatFreeCrm::Callback::Helper
ActionController::Base.include FatFreeCrm::Callback::Helper

require "fat_free_crm/errors"
ActiveModel::Errors.include FatFreeCrm::Errors

require "fat_free_crm/fields"
ActiveRecord::Base.include FatFreeCrm::Fields

require "fat_free_crm/i18n"
ActionView::Base.include FatFreeCrm::I18n
ActionController::Base.include FatFreeCrm::I18n

require "fat_free_crm/permissions"
ActiveRecord::Base.include FatFreeCrm::Permissions

require "fat_free_crm/sortable"
ActiveRecord::Base.include FatFreeCrm::Sortable

require "activemodel-serializers-xml"
require "country_select"
require "gravatar_image_tag"
