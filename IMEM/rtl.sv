```systemverilog
module imem(
    input  logic [31:0] a,
    output logic [31:0] rd
);

    logic [31:0] RAM [0:63];

    initial begin
        $readmemh("IMEM/imem.txt", RAM);
    end

    always_comb begin
        if (a[1:0] == 2'b00 && a < 256)
            rd = RAM[a[7:2]];
        else
            rd = 32'h00000013; // RISC-V NOP (ADDI x0, x0, 0)
    end

endmodule
```
