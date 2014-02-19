Deface::Override.new(:virtual_path => 'spree/shared/_routes',
                     :name => 'add_js_spree_route',
                     :insert_bottom => "script",
                     :text => "
Spree.routes.feedback = \"<%= feedback_update_path %>\"
                     ")