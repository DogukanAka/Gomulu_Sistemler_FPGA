module LED_Controller(
    input clk,
    output reg led_r,
    output reg led_b,
    output reg led_g
);

reg [31:0] timer = 0;

always @(posedge clk) begin
    timer <= timer + 1;
    if (timer >= 0 && timer < 200_000_000) begin // 10 saniye boyunca kırmızı LED yanacak
        led_r <= 1;
        led_b <= 0;
        led_g <= 0;
    end 
    else if (timer >= 200_000_000 && timer < 310_000_000) begin // 5 saniye boyunca yeşil LED yanacak
        led_r <= 0;
        led_b <= 0;
        led_g <= 1;
    end 
    else if (timer >= 310_000_000 && timer < 370_000_000) begin // 2 saniye boyunca mavi LED yanacak
        led_r <= 0;
        led_b <= 1;
        led_g <= 0;
    end 
    else begin // herhangi biri değilse tüm LED'ler kapalı olacak
        led_r <= 0;
        led_b <= 0;
        led_g <= 0;
        timer <= 0;
    end
end

endmodule