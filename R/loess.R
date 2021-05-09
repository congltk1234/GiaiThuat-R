help(loess)
"Sự miêu tả
Phù hợp với một bề mặt đa thức được xác định bởi một hoặc nhiều dự đoán số, sử dụng khớp cục bộ.
Sử dụng"
loess(formula, data, weights, subset, na.action, model = FALSE,
      span = 0.75, enp.target, degree = 2,
      parametric = FALSE, drop.square = FALSE, normalize = TRUE,
      family = c("gaussian", "symmetric"),
      method = c("loess", "model.frame"),
      control = loess.control(...), ...)
"Tranh luận
formula
một công thức chỉ định phản hồi số và một đến bốn yếu tố dự đoán số (được chỉ định tốt nhất thông qua một tương tác, nhưng cũng có thể được chỉ định một cách cộng thêm). Sẽ bị ép buộc vào một công thức nếu cần thiết.
data
một khung dữ liệu, danh sách hoặc môi trường tùy chọn (hoặc đối tượng bị ép buộc bởi as.data.frame thành một khung dữ liệu) có chứa các biến trong mô hình. Nếu không được tìm thấy trong dữ liệu, các biến được lấy từ môi trường (công thức), điển hình là môi trường mà từ đó hoàng thổ được gọi.
weights
trọng lượng tùy chọn cho từng trường hợp.
subset
một đặc tả tùy chọn của một tập hợp con dữ liệu sẽ được sử dụng.
na.action
hành động cần thực hiện với các giá trị bị thiếu trong phản hồi hoặc các yếu tố dự đoán. Mặc định được cung cấp bởi getOption ("na.action").
model
khung mô hình có nên được trả lại không?
  
span
tham số α kiểm soát mức độ làm mịn.
enp.target
một cách thay thế để chỉ định khoảng, làm số lượng tham số tương đương gần đúng sẽ được sử dụng.
degree
bậc của đa thức sẽ được sử dụng, thường là 1 hoặc 2. (Độ 0 cũng được phép, nhưng hãy xem phần ‘Lưu ý’.)
parametric
bất kỳ điều khoản nào nên được trang bị trên toàn cầu thay vì cục bộ Các thuật ngữ có thể được chỉ định bằng tên, số hoặc dưới dạng vectơ logic có cùng độ dài với số lượng các yếu tố dự đoán.
drop.square
để phù hợp với nhiều hơn một dự đoán và độ = 2, có nên bỏ thuật ngữ bậc hai cho các dự đoán cụ thể không? Các thuật ngữ được chỉ định theo cách tương tự như đối với tham số.
normalize
Các yếu tố dự đoán có nên được chuẩn hóa thành một thang đo chung nếu có nhiều hơn một? Chuẩn hóa được sử dụng là đặt độ lệch chuẩn được cắt bớt 10% thành một. Đặt thành false cho các công cụ dự đoán tọa độ không gian và các công cụ khác được biết là nằm trên một tỷ lệ chung.
family
nếu khớp "gaussian" là bình phương nhỏ nhất và nếu "đối xứng", công cụ ước lượng M giảm dần được sử dụng với hàm số hai của Tukey. Có thể viết tắt.
method
phù hợp với mô hình hoặc chỉ trích xuất khung mô hình. Có thể viết tắt.
control
tham số điều khiển: xem loess.control.
..............."
"Chi tiết
Lắp được thực hiện tại địa phương. Có nghĩa là, đối với sự phù hợp tại điểm x, sự phù hợp được thực hiện bằng cách sử dụng các điểm trong vùng lân cận của x, được tính trọng số bởi khoảng cách của chúng so với x (với sự khác biệt về các biến 'tham số' bị bỏ qua khi tính toán khoảng cách). Kích thước của vùng lân cận được kiểm soát bởi α (đặt bởi span hoặc enp.target). Đối với α <1, vùng lân cận bao gồm tỷ lệ α của các điểm và các điểm này có trọng số tam giác (tỷ lệ với (1 - (dist / maxdist) ^ 3) ^ 3). Đối với α> 1, tất cả các điểm được sử dụng, với ‘khoảng cách tối đa’ được giả định là α ^ (1 / p) nhân với khoảng cách tối đa thực tế cho p biến giải thích.
Đối với họ mặc định, khớp là hình vuông nhỏ nhất (có trọng số). Đối với family = "metric ", một số lần lặp lại của quy trình ước lượng M với trọng số sinh học của Tukey được sử dụng. Hãy lưu ý rằng vì giá trị ban đầu là phù hợp với bình phương nhỏ nhất, đây không cần phải là một phù hợp rất bền.
Điều quan trọng là phải điều chỉnh danh sách điều khiển để đạt được tốc độ chấp nhận được. Xem loess.control để biết thêm chi tiết."
"các ví dụ:"
cars.lo <- loess(dist ~ speed, cars)
predict(cars.lo, data.frame(speed = seq(5, 30, 1)), se = TRUE)
# to allow extrapolation
cars.lo2 <- loess(dist ~ speed, cars,
                  control = loess.control(surface = "direct"))
predict(cars.lo2, data.frame(speed = seq(5, 30, 1)), se = TRUE)