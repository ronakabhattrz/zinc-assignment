# Common Bootstrap which is responsible for processing the STDIN

# Requiring all utility classes
Dir[File.dirname(__FILE__) + 'entities/*.rb'].each { |file| require file }

# Requiring all helper classes
Dir[File.dirname(__FILE__) + '/helpers/*.rb'].each { |file| require file }

# Requiring all classes in the classes directory
Dir[File.dirname(__FILE__) + '/*.rb'].each { |file| require file }

# Maximum number of keywords as per the problem statement
MAXIMUM_NUMBER_OF_KEYWORDS = 8

input_processor = InputProcessor.new;

input_processor.process_input_data()
input_processor.display_output()