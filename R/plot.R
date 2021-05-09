help(plot)
Hàm Scatterplot mặc định
"Sự miêu tả
Vẽ biểu đồ phân tán với các trang trí như trục và tiêu đề trong cửa sổ đồ họa đang hoạt động.
Sử dụng:"
## Default S3 method:
plot(x, y = NULL, type = "p",  xlim = NULL, ylim = NULL,
     log = "", main = NULL, sub = NULL, xlab = NULL, ylab = NULL,
     ann = par("ann"), axes = TRUE, frame.plot = axes,
     panel.first = NULL, panel.last = NULL, asp = NA,
     xgap.axis = NA, ygap.axis = NA,
     ...)
"3. Tranh Luận:
x, y    các đối số x và y cung cấp tọa độ x và y cho biểu đồ. Bất kỳ cách xác định tọa độ hợp lý nào cũng được chấp nhận. Xem hàm xy.coords để biết thêm chi tiết. Nếu được cung cấp riêng, chúng phải có cùng chiều dài.
type    Chuỗi 1 ký tự cho loại cốt truyện mong muốn. Các giá trị sau có thể có, để biết chi tiết, hãy xem biểu đồ:
         "p" cho điểm, "l" cho dòng, 
         "b" cho cả điểm và đường, 
         "c" cho các điểm trống được nối bởi các dòng, 
         "o" cho các điểm được tô đậm và dòng, 
         "s" và "S" cho các bậc cầu thang và 
         "h" cho các đường thẳng đứng giống biểu đồ. Cuối cùng, 
         "n" không tạo ra bất kỳ điểm hoặc dòng nào.
xlim    giới hạn x (x1, x2) của plot. Lưu ý rằng x1> x2 được cho phép và dẫn đến một "trục đảo ngược".
         Giá trị mặc định, NULL, chỉ ra rằng phạm vi của các giá trị hữu hạn được vẽ nên được sử dụng.
ylim    giới hạn y của plot
log     một chuỗi ký tự chứa "x" nếu trục x là logarit, "y" nếu trục y là logarit và "xy" hoặc "yx" nếu cả hai trục là logarit.
main    tiêu dề của plot
sub     tiêu dề phụ cụa plot 
.........
"
"
Chi tiết
Các tham số đồ họa thường được sử dụng là:
col
Màu sắc cho các đường và điểm. Nhiều màu có thể được chỉ định để mỗi điểm có thể có màu riêng. Nếu có ít màu hơn số điểm, chúng sẽ được tái chế theo kiểu tiêu chuẩn. Tất cả các đường sẽ được vẽ bằng màu đầu tiên được chỉ định.
bg
một vector màu nền cho các biểu tượng cốt truyện mở, xem các điểm. Lưu ý: đây không phải là cài đặt giống như par ("bg").
pch
một vectơ gồm các ký tự hoặc biểu tượng vẽ biểu đồ: xem các điểm.
cex
một vectơ số cho biết số lượng mà các ký tự và biểu tượng vẽ nên được chia tỷ lệ so với mặc định. Điều này hoạt động như một bội số của mệnh ("cex"). NULL và NA tương đương với 1,0. Lưu ý rằng điều này không ảnh hưởng đến chú thích: xem bên dưới.
lty
một vectơ của các loại đường, xem mệnh.
cex.main, col.lab, font.sub, v.v.
cài đặt cho tiêu đề chính và phụ và chú thích trục, xem tiêu đề và mệnh.
lwd
vectơ độ rộng dòng, xem par."
"Ghi chú
Sự hiện diện của panel.first và panel.last là một điều bất thường trong lịch sử: các ô mặc định không có 'bảng điều khiển', không giống như v.d. cặp lô. Để có nhiều quyền kiểm soát hơn, hãy sử dụng các hàm lập biểu đồ cấp thấp hơn: plot.default gọi lần lượt một số hàm plot.new, plot.window, plot.xy, axis, box và title, và các âm mưu có thể được xây dựng bằng cách gọi chúng riêng lẻ hoặc bằng cách gọi cốt truyện (type = "n") và thêm các phần tử khác.
Cốt truyện chung đã được chuyển từ gói đồ họa sang gói cơ sở trong R 4.0.0. Nó hiện được xuất lại từ không gian tên đồ họa để cho phép các gói nhập nó từ đó tiếp tục hoạt động, nhưng điều này có thể thay đổi trong các phiên bản R trong tương lai.
Nguời giới thiệuu
Becker, R. A., Chambers, J. M. và Wilks, A. R. (1988) Ngôn ng??? S m???i. Wadsworth & Brooks / Cole.
Cleveland, W. S. (1985) Các y???u t??? c???a d??? li???u d??? th???. Monterey, CA: Wadsworth.
Murrell, P. (2005) R D??? h???a. Chapman & Hall / CRC Press.