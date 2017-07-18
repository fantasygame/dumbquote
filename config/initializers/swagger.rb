GrapeSwaggerRails.options.url = "/api/docs"
GrapeSwaggerRails.options.before_action_proc = proc {
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
  current_user || redirect_to("/users/sign_in")
}
GrapeSwaggerRails.options.app_name = "Dumbquote"
GrapeSwaggerRails.options.hide_url_input = true
GrapeSwaggerRails.options.hide_api_key_input = true
