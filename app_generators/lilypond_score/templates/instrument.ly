<%= version_str %>

\include "<%= instrument %>.lyi"

instrument = "<%= instrument.capitalize %>"

<% (0...movements).each do |movement| -%>
<% mvt = "Mvt" + roman(movement) -%>
notes<%= mvt %> = \<%= instrument %><%= mvt %>

<% end -%>

\include "part.lyi"