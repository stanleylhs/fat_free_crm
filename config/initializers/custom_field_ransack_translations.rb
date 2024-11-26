# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
# Load field names for custom fields, for Ransack search

Rails.application.config.after_initialize do
  if ActiveRecord::Base.connection.table_exists?(:settings) && ActiveRecord::Base.connection.table_exists?(:custom_fields)
    I18n.backend.load_translations

    translations = { ransack: { attributes: {} } }
    CustomField.find_each do |custom_field|
      if custom_field.field_group.present?
        model_key = custom_field.klass.model_name.singular
        translations[:ransack][:attributes][model_key] ||= {}
        translations[:ransack][:attributes][model_key][custom_field.name] = custom_field.label
      end
    end

    I18n.backend.store_translations(Setting.locale.to_sym, translations)
  end
  rescue ActiveRecord::NoDatabaseError, ActiveRecord::StatementInvalid
end
