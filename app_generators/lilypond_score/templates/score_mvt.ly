<%= version_str %>

\version "2.12.2"

\include "defs.lyi"
<% instruments.each do |ins| -%>
\include "<%= ins %>.lyi"
<% end -%>

instrument = ""

\book {

  \include "header.lyi"

  \score {
    <<
      <% instruments.each do |instrument| %>
      \new Staff {
        \set Staff.instrumentName = "<%= instrument.capitalize %>"
        % \set Staff.shortInstrumentName = ""
        % \set Staff.midiInstrument = ""
        <%- if instrument == instruments.last -%>
        << \<%= instrument %><%= mvt %> \keepWithTag #'score \outline<%= mvt %> >>
        <%- else -%>
        \<%= instrument %><%= mvt %> \keepWithTag #'score
        <%- end -%>
      }
      <% end %>
    >>
    
    \header { piece = \<%= mvt %> }
    
    \layout {
      
    }
  }

}
