---
layout: post
title:  "Flask + Matplotlib"
date:   2020-04-04
permalink: /projects/Flask+Matplotlib
categories: projects
---
Display interactive matplotlib plots in a web browser with Flask.



{% highlight python %}
@app.route("/")
def index():
    size = int(request.args.get("size", 400))
    x_label = str(request.args.get("x_label", "xlabel"))
    y_label = str(request.args.get("y_label", "ylabel"))
    title = str(request.args.get("title", "title"))
    plot_indices = str(request.args.get("plot_indices", "0 1 2"))
    
    return render_template('inputs.html', **locals())
{% endhighlight %}


{% highlight html %}
<!doctype html>
<html lang="en">
<head>
	<title>Plotting tool</title>
</head>
<body>

	<form method="get" action="/">
		<label for="x_label">x-axis label</label>
		<input name="x_label", type=string, value="{{x_label}}" /> <br>
		<label for="y_label">y-axis label</label>
		<input name="y_label", type=string, value="{{y_label}}" /> <br>
		<label for="title">title</label>
		<input name="title", type=string, value="{{title}}" /> <br>
		<label for="size">plot size</label>
		<input name="size", type=int, value="{{size}}" /> <br>
		<label for="plot_indices">select traces</label>
		<input name="plot_indices", type=string, value="{{plot_indices}}" /> <br>

		<input type=submit value="update plot">
	</form>

</body>
<h3>Plot</h3>
<img src="/{{size}}-{{x_label}}-{{y_label}}-{{plot_indices}}-{{title}}.svg"
	alt="error"
	height={{size}}
>
</html>
{% endhighlight %}