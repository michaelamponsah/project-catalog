# App entry point

require_relative 'start'

def main
  new_app = Start.new
  new_app.app_start
end

main
