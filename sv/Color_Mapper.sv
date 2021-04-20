//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper (
    input [9:0] DrawX, DrawY, 
    input logic [1:0] stage_color_index,
    output logic [7:0] Red, Green, Blue 
);
    // 208 x 200
    // ['0x000000', '0xFFFFFF', '0x0000FF', '0xB6B6AA']
    always_comb
    begin
        if (DrawX < 208 && DrawY < 200)
        begin
            case (stage_color_index)
                2'b00:
                begin
                    Red = 8'h00;
                    Green = 8'h00;
                    Blue = 8'h00;
                end
                2'b01:
                begin
                    Red = 8'hFF;
                    Green = 8'hFF;
                    Blue = 8'hFF;
                end
                2'b10:
                begin
                    Red = 8'h00;
                    Green = 8'h00;
                    Blue = 8'hFF;
                end
                2'b11:
                begin
                    Red = 8'hB6;
                    Green = 8'hB6;
                    Blue = 8'hAA;
                end
                default:
                begin
                    Red = 8'h00;
                    Green = 8'h00;
                    Blue = 8'h00;
                end
            endcase
        end
        else
        begin
            Red = 8'h00;
            Green = 8'h00;
            Blue = 8'h00;
        end
    end
    
endmodule
