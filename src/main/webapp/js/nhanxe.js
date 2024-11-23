document.addEventListener('DOMContentLoaded', function () {
    const step1 = document.getElementById('step1');
    const step2 = document.getElementById('step2');
    const step3 = document.getElementById('step3');
    const steps = [step1, step2, step3]; // Mảng chứa các bước
    const headers = document.querySelectorAll('.step'); // Các bước header
    let currentStep = 0;

    function showStep(step) {
        // Kiểm tra xem bước hiện tại có hợp lệ không
        if (step >= 0 && step < steps.length) {
            // Ẩn tất cả các bước và chỉ hiển thị bước hiện tại
            steps.forEach((s, index) => {
                if (index === step) {
                    s.style.display = 'block'; // Hiển thị bước hiện tại
                    headers[index].classList.add('active'); // Đánh dấu bước hiện tại
                } else {
                    s.style.display = 'none'; // Ẩn các bước khác
                    headers[index].classList.remove('active'); // Gỡ bỏ đánh dấu các bước khác
                }
            });
        } else {
            console.error("Bước không hợp lệ:", step);
        }
    }

    // Bước 1 -> Bước 2
    const nextStep1 = document.getElementById('nextStep1');
    nextStep1.addEventListener('click', function () {
        if (!nextStep1.disabled) {
            currentStep++;
            showStep(currentStep); // Chuyển sang bước 2
        }
    });

    // Bước 2 -> Bước 3
    const nextStep2 = document.getElementById('nextStep2');
    nextStep2.addEventListener('click', function () {
        if (!nextStep2.disabled) {
            currentStep++;
            showStep(currentStep); // Chuyển sang bước 3
        }
    });

    // Quay lại bước trước
    document.querySelectorAll('.prevBtn').forEach(button => {
        button.addEventListener('click', function () {
            currentStep--;
            showStep(currentStep); // Quay lại bước trước
        });
    });

    // Khởi động giao diện với bước đầu tiên
    showStep(currentStep);

    // Xử lý chọn nhiều khách hàng bằng checkbox
    const customerCheckboxes = document.querySelectorAll('.customerCheckbox');
    // const nextStep1 = document.getElementById('nextStep1');
    const selectAllCheckbox = document.getElementById('selectAllCheckbox'); // Checkbox chọn tất cả

    // Cập nhật nút "Tiếp tục" khi có ít nhất một checkbox được chọn
    function updateNextButton() {
        const anyChecked = Array.from(customerCheckboxes).some(checkbox => checkbox.checked);
        nextStep1.disabled = !anyChecked; // Chỉ bật nút nếu có ít nhất một checkbox được chọn
    }

    // Xử lý khi chọn/hủy chọn từng khách hàng
    customerCheckboxes.forEach(checkbox => {
        checkbox.addEventListener('change', function () {
            if (this.checked) {
                this.closest('tr').classList.add('selected');
            } else {
                this.closest('tr').classList.remove('selected');
            }

            // Kiểm tra xem tất cả đã được chọn chưa để cập nhật trạng thái của "Chọn Tất Cả"
            const allChecked = Array.from(customerCheckboxes).every(checkbox => checkbox.checked);
            selectAllCheckbox.checked = allChecked;

            updateNextButton(); // Cập nhật lại trạng thái nút "Tiếp tục"
        });
    });

    // Xử lý chọn tất cả hoặc bỏ chọn tất cả khách hàng
    selectAllCheckbox.addEventListener('change', function () {
        const isChecked = this.checked;
        customerCheckboxes.forEach(checkbox => {
            checkbox.checked = isChecked;
            if (isChecked) {
                checkbox.closest('tr').classList.add('selected');
            } else {
                checkbox.closest('tr').classList.remove('selected');
            }
        });
        updateNextButton(); // Cập nhật lại nút "Tiếp tục"
    });


    // Xử lý tìm kiếm khách hàng và đổi màu khi khớp, chỉ áp dụng khi có từ 2 ký tự trở lên
    const searchInput = document.getElementById('searchCustomer');
    const customerRows = document.querySelectorAll('#customerList tbody tr');

    searchInput.addEventListener('keyup', function () {
        const searchValue = searchInput.value.toLowerCase();

        if (searchValue.length >= 2) {
            // Thực hiện tìm kiếm khi có từ 2 ký tự trở lên
            customerRows.forEach(row => {
                const rowText = row.textContent.toLowerCase();
                if (rowText.includes(searchValue)) {
                    row.classList.add('highlight'); // Thêm lớp highlight cho hàng khớp
                } else {
                    row.classList.remove('highlight'); // Loại bỏ lớp highlight nếu không khớp
                }
            });
        } else {
            // Hiển thị tất cả các hàng nếu từ khóa ít hơn 2 ký tự
            customerRows.forEach(row => {
                row.classList.remove('highlight'); // Loại bỏ highlight cho tất cả các hàng
            });
        }
    });

    // Mở giao diện thêm khách hàng mới
    const addCustomerBtn = document.getElementById('addCustomerBtn');
    const cancelAddCustomer = document.getElementById('cancelAddCustomer');
    const addCustomerForm = document.getElementById('addCustomerForm');
    const step1Content = document.getElementById('step1');
    const newCustomerForm = document.getElementById('newCustomerForm');
    const customerListBody = document.querySelector('#customerList tbody');

    addCustomerBtn.addEventListener('click', function () {
        step1Content.style.display = 'none';
        addCustomerForm.style.display = 'block';
    });

    // Hủy việc thêm khách hàng mới
    cancelAddCustomer.addEventListener('click', function () {
        addCustomerForm.style.display = 'none';
        step1Content.style.display = 'block';
    });

    // Xử lý lưu khách hàng mới
    newCustomerForm.addEventListener('submit', function (event) {
        event.preventDefault();

        // Lấy thông tin từ form
        const name = document.getElementById('name').value;
        const phone = document.getElementById('phone').value;
        const email = document.getElementById('email').value;
        const carBrand = document.getElementById('carBrand').value;
        const serviceType = document.getElementById('serviceType').value;
        const appointmentTime = document.getElementById('appointmentTime').value;
        const notes = document.getElementById('notes').value;

        // Tạo hàng mới cho bảng khách hàng
        const newRow = document.createElement('tr');
        newRow.innerHTML = `
            <td><input type="checkbox" class="customerCheckbox"></td>
            <td>${name}</td>
            <td>${phone}</td>
            <td>${email}</td>
            <td>${carBrand}</td>
            <td>${serviceType}</td>
            <td>${appointmentTime}</td>
            <td>${notes}</td>
        `;

        // Thêm hàng mới vào bảng
        customerListBody.appendChild(newRow);

        // Reset form và quay lại giao diện chọn khách hàng
        newCustomerForm.reset();
        addCustomerForm.style.display = 'none';
        step1Content.style.display = 'block';

        // Cập nhật lại sự kiện cho checkbox mới thêm vào
        const newCheckbox = newRow.querySelector('.customerCheckbox');
        newCheckbox.addEventListener('change', function () {
            if (this.checked) {
                this.closest('tr').classList.add('selected');
            } else {
                this.closest('tr').classList.remove('selected');
            }
            updateNextButton(); // Cập nhật lại trạng thái nút "Tiếp tục"
        });
    });


//    // Bước 1: Chọn khách hàng
//    nextStep1.addEventListener('click', function () {
//        if (!nextStep1.disabled) {
//            currentStep++;
//            showStep(currentStep);
//        }
//    });

    // Chọn dịch vụ
//    const serviceSelect = document.getElementById('serviceSelect');
//    const nextStep2 = document.getElementById('nextStep2');

    // Kích hoạt nút "Tiếp tục" khi có ít nhất một dịch vụ được chọn
    serviceSelect.addEventListener('change', function () {
        if (serviceSelect.selectedOptions.length > 0) {
            nextStep2.disabled = false;
        } else {
            nextStep2.disabled = true;
        }
    });

//    // Bước 2 -> Bước 3
//    nextStep2.addEventListener('click', function () {
//        if (!nextStep2.disabled) {
//            currentStep++;
//            showStep(currentStep);
//        }
//    });

//    // Chọn nhân viên kỹ thuật
    const technicianSelect = document.getElementById('technicianSelect');
    const confirmBtn = document.getElementById('confirmBtn');

    // Kích hoạt nút "Xác Nhận" khi chọn một nhân viên
    technicianSelect.addEventListener('change', function () {
        confirmBtn.disabled = !technicianSelect.value;
    });
});
