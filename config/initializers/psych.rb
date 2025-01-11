# config/initializers/psych.rb
require 'psych'

# Enable aliases in YAML parsing by ensuring options is initialized properly
Psych::Parser.class_eval do
  alias_method :old_initialize, :initialize

  def initialize(*args)
    old_initialize(*args)
    @options ||= {}  # Ensure @options is initialized
    @options[:aliases] = true
  end
end
