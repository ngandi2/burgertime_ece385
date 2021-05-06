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
    input logic chef, sausage, egg,
    input logic blank, 
    input logic [1:0] stage_color_index, 
    input logic [2:0] sprite_color_index, 
    output logic [7:0] Red, Green, Blue 
);
    // 208 x 200
    // ['0x000000', '0xFFFFFF', '0x0000FF', '0xB6B6AA']
    always_comb
    begin
        if (blank)
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
            case (sprite_color_index)
                3'b001: 
                begin
                    Red = 8'hFF;
                    Green = 8'h00;
                    Blue = 8'h00;
                end
                3'b010: 
                begin
                    Red = 8'hFF;
                    Green = 8'hFF;
                    Blue = 8'hFF;
                end
                3'b011: 
                begin
                    Red = 8'h6D;
                    Green = 8'h6D;
                    Blue = 8'h6D;
                end
                3'b100: 
                begin
                    Red = 8'hFF;
                    Green = 8'hFF;
                    Blue = 8'h00;
                end
                3'b101: 
                begin
                    Red = 8'h00;
                    Green = 8'hFF;
                    Blue = 8'h00;
                end
                3'b110: 
                begin
                    Red = 8'hFF;
                    Green = 8'hB6;
                    Blue = 8'h00;
                end
                3'b111: 
                begin
                    Red = 8'h6D;
                    Green = 8'hB6;
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
        // ['0x000000', '0xFF0000', '0xFFFFFF', '0x6D6D6D', '0xFFFF00', '0x00FF00', '0xFFB600', '0x6DB600']
        // if (chef)
        // begin
        //     // skip the 3'b000 case since black is for transparency
        //     case (sprite_color_index)
        //         3'b001: 
        //         begin
        //             Red = 8'hFF;
        //             Green = 8'h00;
        //             Blue = 8'h00;
        //         end
        //         3'b010: 
        //         begin
        //             Red = 8'hFF;
        //             Green = 8'hFF;
        //             Blue = 8'hFF;
        //         end
        //         3'b011: 
        //         begin
        //             Red = 8'h6D;
        //             Green = 8'h6D;
        //             Blue = 8'h6D;
        //         end
        //         3'b100: 
        //         begin
        //             Red = 8'hFF;
        //             Green = 8'hFF;
        //             Blue = 8'h00;
        //         end
        //         3'b101: 
        //         begin
        //             Red = 8'h00;
        //             Green = 8'hFF;
        //             Blue = 8'h00;
        //         end
        //         3'b110: 
        //         begin
        //             Red = 8'hFF;
        //             Green = 8'hB6;
        //             Blue = 8'h00;
        //         end
        //         3'b111: 
        //         begin
        //             Red = 8'h6D;
        //             Green = 8'hB6;
        //             Blue = 8'h00;
        //         end
        //     endcase
        // end
        // if (burger1_top)
        // begin
        //     // skip the 3'b000 case since black is for transparency
        //     case (sprite_color_index)
        //         3'b001: 
        //         begin
        //             Red = 8'hFF;
        //             Green = 8'h00;
        //             Blue = 8'h00;
        //         end
        //         3'b010: 
        //         begin
        //             Red = 8'hFF;
        //             Green = 8'hFF;
        //             Blue = 8'hFF;
        //         end
        //         3'b011: 
        //         begin
        //             Red = 8'h6D;
        //             Green = 8'h6D;
        //             Blue = 8'h6D;
        //         end
        //         3'b100: 
        //         begin
        //             Red = 8'hFF;
        //             Green = 8'hFF;
        //             Blue = 8'h00;
        //         end
        //         3'b101: 
        //         begin
        //             Red = 8'h00;
        //             Green = 8'hFF;
        //             Blue = 8'h00;
        //         end
        //         3'b110: 
        //         begin
        //             Red = 8'hFF;
        //             Green = 8'hB6;
        //             Blue = 8'h00;
        //         end
        //         3'b111: 
        //         begin
        //             Red = 8'h6D;
        //             Green = 8'hB6;
        //             Blue = 8'h00;
        //         end
        //     endcase
        // end
    end
    
endmodule
