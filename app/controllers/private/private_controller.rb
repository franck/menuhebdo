module Private
  class PrivateController < ApplicationController
    layout "private"
    before_filter :authenticate_admin!
  end
end
