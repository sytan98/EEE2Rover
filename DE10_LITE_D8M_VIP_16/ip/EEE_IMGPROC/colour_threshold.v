module colour_threshold(

	input     [8:0] 	hue,//  0 - 360
	input     [7:0]   saturation,// 0- 255
	input     [7:0] 	value_b, // 0- 255
	output     red_detect,
	output	  green_detect,
	output	  blue_detect,
	output     grey_detect,
	output     yellow_detect
);
	// Detect red areas

	// assign red_detect = (red < 8'd255) & (red > 8'd 150)
	// 							& (green < 8'd150) & (green > 8'd120) 
	// 							& (blue < 8'd140 ) & ( blue > 8'd100);
	assign red_detect = (hue < 8'd20) & (hue > 8'd0)
							  & (saturation < 8'd255) & ( saturation > 8'd60) 
							  & (value_b < 8'd255 ) & ( value_b > 8'd60);

	// assign green_detect = (red < 8'd140) & (red > 8'd 110)
	// 							& (green < 8'd255) & (green > 8'd140) 
	// 							& (blue < 8'd140 ) & ( blue > 8'd100);
	assign green_detect = (hue < 8'd130) & (hue > 8'd100)
								 & (saturation < 8'd255) & ( saturation > 8'd115) 
								 & (value_b < 8'd255 ) & ( value_b > 8'd75);

	// assign blue_detect = (red < 8'd120) & (red > 8'd 90)
	// 							& (green < 8'd170) & (green > 8'd130) 
	// 							& (blue < 8'd255 ) & ( blue > 8'd120);
	assign blue_detect = (hue < 8'd220) & (hue > 8'd160)
							  & (saturation < 8'd255) & ( saturation > 8'd50) 
							  & (value_b < 8'd255 ) & ( value_b > 8'd75);

	// assign grey_detect = (red < 8'd110) & (red > 8'd 100)
	// 							& (green < 8'd120) & (green > 8'd110) 
								// & (blue < 8'd120 ) & ( blue > 8'd90);
	assign grey_detect = (hue < 8'd100) & (hue > 8'd40)
							  & (saturation < 8'd150) & ( saturation > 8'd10) 
							  & (value_b < 8'd50 ) & ( value_b > 8'd20);

	// assign yellow_detect = (red < 8'd230) & (red > 8'd 180)
	// 							& (green < 8'd190) & (green > 8'd140) 
	// 							& (blue < 8'd120 ) & ( blue > 8'd90);

	assign yellow_detect = (hue < 8'd60) & (hue > 8'd20)
							  & (saturation < 8'd255) & ( saturation > 8'd100) 
							  & (value_b < 8'd255 ) & ( value_b > 8'd80);
endmodule