
export class OpCode {
    public code: number;
    public mnem: string;
    public mode: string;
    //public size: number;

    constructor(code: number, mnem: string, mode: string, size: number = 0) {
        this.code = code;
        this.mnem = mnem;
        this.mode = mode;
        //this.size = size;
    }
}
