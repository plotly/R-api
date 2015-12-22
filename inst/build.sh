git clone https://github.com/plotly/plotly.js.git
cd plotly.js
git checkout tags/v1.2.1 -b v1.2.1
npm install
browserify -r d3 | uglifyjs -m -c warnings=false -b beautify=false,ascii-only=true --screw-ie8 -o ../htmlwidgets/lib/d3/d3.min.js
browserify -r topojson | uglifyjs -m -c warnings=false -b beautify=false,ascii-only=true --screw-ie8 -o ../htmlwidgets/lib/topojson/topojson.min.js
browserify -x d3 -x topojson -s Plotly src/index.js | uglifyjs -m -c warnings=false -b beautify=false,ascii-only=true --screw-ie8 -o ../htmlwidgets/lib/plotlyjs/plotly-x.min.js
