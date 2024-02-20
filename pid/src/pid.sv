//=================================================================================
// MIT License
//
// Copyright (c) 2023 - 2024 Adria Babiano Novella
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
// Description    : Hardware PID Controller
// Author         : Adria Babiano
// Created        : Feb 09 2024
//
//=================================================================================

module pid (
	input logic clk,
	input logic rst_n,
	input real setpoint,
	input real measurement,
	input real Kp,
	input real Ki,
	input real Kd,
	input real sampleTime,
	input real tau,
	output real out
	);

	real prev_error;
	real integral;
	real derivative;

	real error = setpoint-measurement;

	real proportional = Kp * error;

	always_ff @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			integral <= 0.0;
		end else begin
			integral <= integral + 0.5 * Ki * error * sampleTime;
		end
	end

	always_ff @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			derivative <= 0.0;
		end else begin
			derivative <= (2 * Kd * (error - prev_error) / (2 * sampleTime + tau)) + (derivative * (2 * sampleTime + tau) / (2 * sampleTime - tau));
		end
		prev_error <= error;
	end

	assign out = proportional + integral + derivative;

endmodule
