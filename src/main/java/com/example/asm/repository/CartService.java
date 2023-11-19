package com.example.asm.repository;

import com.example.asm.entity.Cart;
import com.example.asm.entity.ChiTietSP;
import com.example.asm.entity.KhuyenMai_SanPham;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.ApplicationScope;
import org.springframework.web.context.annotation.SessionScope;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.example.asm.viewModel.CartViewModel;

@Component
@SessionScope
public class CartService {

    @Autowired
    IChiTietSPRepo chiTietSPRepo;
    @Autowired
    IKhuyenMai_SanPhamRepo khuyenMai_sanPhamRepo;

    private final Cart cart = new Cart();

//    public CartService() {
//        cart.getProductInCart().put(29,11);
//        cart.getProductInCart().put(24,1);
//    }

    public Map<Integer,Integer> getProductInCart(){
        return cart.getProductInCart();
    }
    public void addOrUpdateToCart(Integer idCTSP,Integer sl){
        Map<Integer,Integer> sanPhamTrongGio  = cart.getProductInCart();

        boolean chk = false;

//        for (Map.Entry<ChiTietSP,Integer>  c :sanPhamTrongGio.entrySet()) {
//            if(c.getKey().getId() == chiTietSP.getId()){
//                chk = true;
//                soLuongHienCo = c.getValue();
//                System.out.println(soLuongHienCo);
//                System.out.println("aaaaaaaaaaaaaaa");
//            }
//        }

        //Nếu sản phẩm đã có trong giỏ thì + dồn số lượng
        if(sanPhamTrongGio.containsKey(idCTSP)){//Kiểm tra sản phẩm có trong giỏ hàng chưa
            //Lấy số lượng hiện tại
            Integer soLuongHienCo = sanPhamTrongGio.get(idCTSP);
            //Cộng số lượng
            Integer soLuongMoi = soLuongHienCo + sl;
            System.out.println("asada");
            System.out.println(soLuongMoi);
            //Cập nhật lại giỏ hàng
            sanPhamTrongGio.put(idCTSP,soLuongMoi);
        }else{
            sanPhamTrongGio.put(idCTSP,sl);
        }
    }

    public void removeProductInCart(Integer idCTSP){
        Map<Integer,Integer> productInCart = cart.getProductInCart();
        productInCart.remove(idCTSP);
    }

    public List<CartViewModel> getCartViewModel(){
        Map<Integer,Integer> sanPhamTrongGio  = cart.getProductInCart();
        List<CartViewModel> lst = new ArrayList<>();
        List<KhuyenMai_SanPham> khuyenMai_sanPhams = khuyenMai_sanPhamRepo.getProductOnKhuyenMai();
        boolean chk = false;

        for (Map.Entry<Integer,Integer>  c :sanPhamTrongGio.entrySet()) {
           ChiTietSP CTSP = chiTietSPRepo.getReferenceById(c.getKey());
            chk = false;

            for(KhuyenMai_SanPham k: khuyenMai_sanPhams){
               if(k.getSanPham().getId() == CTSP.getSanPham().getId()){
                   chk = true;
                   lst.add(new CartViewModel(CTSP.getSanPham().getId(),
                           CTSP.getId(),
                           CTSP.getSanPham().getAnh(),
                           CTSP.getSanPham().getTen(),
                           CTSP.getSanPham().getDanhMuc().getTen(),
                           CTSP.getSanPham().getNsx().getTen(),
                           CTSP.getKichThuoc().getMa(),
                           CTSP.getMauSac().getTen(),
                           c.getValue(),
                           CTSP.getSanPham().getGiaBan(),k.getKhuyenMai().getMucGiam()));
               }
           }
            if(chk == false){
                lst.add(new CartViewModel(CTSP.getSanPham().getId(),
                        CTSP.getId(),
                        CTSP.getSanPham().getAnh(),
                        CTSP.getSanPham().getTen(),
                        CTSP.getSanPham().getDanhMuc().getTen(),
                        CTSP.getSanPham().getNsx().getTen(),
                        CTSP.getKichThuoc().getMa(),
                        CTSP.getMauSac().getTen(),
                        c.getValue(),
                        CTSP.getSanPham().getGiaBan(),0));
            }

        }
        return lst;
    }

    public void removeAllProdcutInCart(){
        Map<Integer,Integer> productInCart = cart.getProductInCart();
        productInCart.clear();
    }

    public void updateSoLuong(Integer key,Integer value){
//        Map<Integer,Integer> product = cart.getProductInCart();
        cart.getProductInCart().put(key,value);
    }
}
