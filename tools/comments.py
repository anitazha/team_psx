# 18545 Fall 2013
# Team PSX
# 9-17-2013
#
# @DESCRIPTION:
# Script that adds header comments to files and modules in the file
#
# @AUTHOR:
# Michael Rosen
# mrrosen
#

# Imports
import sys
import datetime

for filename in sys.argv:
	# Skip self if somehow end up in args
	if (not(".py" in filename)):
		# Open file
		try:
			fh = open(filename, "rt");
			body = fh.read();
			fh.close();
		except:
			print "Failed to open file: " + filename
			continue;

		new_body = "";
		# Check to see if this file already has a header
		if (not("/* @COMMENTING COMPLETE; EOF */" in body)):
			new_body += "/* 18545 Fall 2013\n";
			new_body += " * Team PSX\n";
			new_body += " * " + datetime.datetime.now().strftime("%m-%d-%Y") + "\n";
			new_body += " *\n";
			new_body += " * @MODULES:\n";
			new_body += " * \n";
			new_body += " * @DESCRIPTION:\n";
			new_body += " * {Insert Description Here}\n";
			new_body += " *\n";
			new_body += " * @AUTHOR:\n";
			new_body += " * {Insert Name Here}\n";
			new_body += " * {Insert andrewID Here}\n";
			new_body += " *\n";
			new_body += " */\n\n" + body;
		else:
			new_body = body;

		# Break into list of lines
		lines = new_body.splitlines();

		# Loop through lines and add new module if any are new
		for idx in xrange(len(lines)):
			if ("@MODULES:" in lines[idx]):
				# Remember module list
				mod_list_idx = idx;
			elif (("module " in lines[idx]) and not("*/" in lines[idx - 1])):
				# Add module
				module_line = lines[idx];
				module_name = lines[idx][7:-1];
				lines[idx] = ("\n/* @MODULE: " + module_name + "\n" +
							  " * @DESCRIPTION:\n" +
							  " * {Insert Description Here}\n" +
							  " */\n" + lines[idx]);
				lines[mod_list_idx] += "\n * " + module_name;

		# add footer
		if (not("/* @COMMENTING COMPLETE; EOF */" in body)):
			lines.extend(["\n\n/* @COMMENTING COMPLETE; EOF */"]);

		# Write back file
		fh = open(filename, "wt");
		wb = "";
		for l in lines:
			wb += l + "\n";
		fh.write(wb);
		fh.close();
