<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 별점수 */
        hr {
            background-color: lightgray;
        }

        #starPoint b {
            /* margin-right:10%; */
            float: right;
        }

        .point {
            margin-top: 3%;
            margin-bottom: 3%;
            margin-left: 5%;
            margin-right: 10%;
        }

        .point p {
            margin-bottom: 2%;
            margin-left: 2%;
        }

        .point div ul li{
            margin:0;
            margin-top:2%;
        }

        /* 이미지 사이즈 맞추기 */
        .image-container {
            width: auto;
            height: 15rem;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .image-container img {
            object-fit: fill;
        }

        /* textarea 디자인 */
        .shadow-textarea textarea.form-control::placeholder {
            font-weight: 300;
        }
        .shadow-textarea textarea.form-control {
            padding-left: 0.8rem;
        }

        input[type="radio"]{
            display:none;
        }

        /* 별점 */
        .rating {
            float:left;
        }
        
        .starability-result {
		  position: relative;
		  width: 150px;
		  height: 30px;
		  background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAA8CAMAAABGivqtAAAAxlBMVEUAAACZmZn2viTHuJ72viOampqampr1viSampr3vySampqdnZ34wiX1vSSampr1vSOZmZmampr1viT2vSOampr2viT2viSampr2viSampr2vyX4vyWbm5v3vSSdnZ32wSadnZ36wCWcnJyZmZn/wSr/2ySampr2vSP2viSZmZn2vSSZmZn2vST2viSampr2viSbm5ubm5uZmZn1vSSampqbm5v2vSWampqampr3vSf5wiT5vyagoKD/xCmkpKT/yCSZmZn1vSO4V2dEAAAAQHRSTlMA+vsG9fO6uqdgRSIi7+3q39XVqZWVgnJyX09HPDw1NTAwKRkYB+jh3L6+srKijY2Ef2lpYllZUU5CKigWFQ4Oneh1twAAAZlJREFUOMuV0mdzAiEQBmDgWq4YTWIvKRqT2Htv8P//VJCTGfYQZnw/3fJ4tyO76KE0m1b2fZu+U/pu4QGlA7N+Up5PIz9d+cmkbSrSNr9seT3GKeNYIyeO5j16S28exY5suK0U/QKmmeCCX6xs22hJLVkitMImxCvEs8EG3SCRCN/ViFPqnq5epIzZ07QJJvkM9Tkz1xnkmXbfSvR7f4H8AtXBkLGj74mMvjM1+VHZpAZ4LM4K/LBWEI9jwP71v1ZEQ6dyvQMf8A/1pmdZnKce/VH1iIsdte4U8VEtY23xOujxtFpWDgKbfjD2YeEhY0OzfjGeLyO/XfnNpAcmcjDwKOXRfU1IyiTRyEkaiz67pb9oJHJb9vVqKfgjLBPyF5Sq9T0KmSUhQmtiQrJGPHVi0DoSabj31G2gW3buHd0pY85lNdcCk8xlNDPXMuSyNiwl+theIb9C7RLIpKvviYy+M6H8qGwSAp6Is19+GP6KxwnggJ/kq6Jht5rnRQA4z9zyRRaXssvyqp5I6Vutv0vkpJaJtnjpz/8B19ytIayazLoAAAAASUVORK5CYII=");
		  font-size: 0.1em;
		  color: transparent;
		}
		
		.starability-result:after {
		  content: ' ';
		  position: absolute;
		  left: 0;
		  height: 30px;
		  background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAA8CAMAAABGivqtAAAAxlBMVEUAAACZmZn2viTHuJ72viOampqampr1viSampr3vySampqdnZ34wiX1vSSampr1vSOZmZmampr1viT2vSOampr2viT2viSampr2viSampr2vyX4vyWbm5v3vSSdnZ32wSadnZ36wCWcnJyZmZn/wSr/2ySampr2vSP2viSZmZn2vSSZmZn2vST2viSampr2viSbm5ubm5uZmZn1vSSampqbm5v2vSWampqampr3vSf5wiT5vyagoKD/xCmkpKT/yCSZmZn1vSO4V2dEAAAAQHRSTlMA+vsG9fO6uqdgRSIi7+3q39XVqZWVgnJyX09HPDw1NTAwKRkYB+jh3L6+srKijY2Ef2lpYllZUU5CKigWFQ4Oneh1twAAAZlJREFUOMuV0mdzAiEQBmDgWq4YTWIvKRqT2Htv8P//VJCTGfYQZnw/3fJ4tyO76KE0m1b2fZu+U/pu4QGlA7N+Up5PIz9d+cmkbSrSNr9seT3GKeNYIyeO5j16S28exY5suK0U/QKmmeCCX6xs22hJLVkitMImxCvEs8EG3SCRCN/ViFPqnq5epIzZ07QJJvkM9Tkz1xnkmXbfSvR7f4H8AtXBkLGj74mMvjM1+VHZpAZ4LM4K/LBWEI9jwP71v1ZEQ6dyvQMf8A/1pmdZnKce/VH1iIsdte4U8VEtY23xOujxtFpWDgKbfjD2YeEhY0OzfjGeLyO/XfnNpAcmcjDwKOXRfU1IyiTRyEkaiz67pb9oJHJb9vVqKfgjLBPyF5Sq9T0KmSUhQmtiQrJGPHVi0DoSabj31G2gW3buHd0pY85lNdcCk8xlNDPXMuSyNiwl+theIb9C7RLIpKvviYy+M6H8qGwSAp6Is19+GP6KxwnggJ/kq6Jht5rnRQA4z9zyRRaXssvyqp5I6Vutv0vkpJaJtnjpz/8B19ytIayazLoAAAAASUVORK5CYII=");
		  background-position: 0 -30px;
		}
		
		.starability-result[data-rating="5"]::after {
		  width: 150px;
		}
		
		.starability-result[data-rating="4"]::after {
		  width: 120px;
		}
		
		.starability-result[data-rating="3"]::after {
		  width: 90px;
		}
		
		.starability-result[data-rating="2"]::after {
		  width: 60px;
		}
		
		.starability-result[data-rating="1"]::after {
		  width: 30px;
		}
		
		@media screen and (-webkit-min-device-pixel-ratio: 2), screen and (min-resolution: 192dpi) {
		  .starability-result {
		    background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAB4CAMAAACZ62E6AAABAlBMVEUAAACZmZmampr2vSObm5v/yiufn5+ampr1viP1viSZmZn2viOZmZmampqampr2viSampqampqcnJz5vyScnJz3wSf/wyn/xiujo6Oqqqr/0C/1vSOampr2viP2viOampr2viP2vST2viOampqampqampr1vyP3viSampr2vyT4vyX3viSbm5ubm5v5wCT8xSmgoKCampqampr3vyb2wiWenp72viOampqZmZmampr2viP2viP1viSampqbm5v2vyT3viObm5v4vyadnZ34wSSbm5v2viSZmZn2viP2vST2viP2viT1viOZmZn2viT2viX3viT3vyb2vyOZmZn1vSOZmZlNN+fKAAAAVHRSTlMA9uz4PQwS8O7r5+fTw4yMelw2MB0dFRELBgbS+/Hfu7uxqKWdg4N7ZmZMPi8pKRgPs0w7Nhb14drKw6Gck21tXkNDIyMZ1rDLycTBtaqVknlfV0sGP8ZwAAADW0lEQVRYw9zWvYqDQBSG4TPDoCAqKhYKQgoVLFaIgZCkiCBBUqVazv3fyu4aEXWdM85Uy779A+LP58AfTQgw73AwtxFiZIwbxMbUfuB3H4b49YNfZrbGodoI52+cm9hH9sbZwwAXOFbo2zjDsSzWxnecuuvaM8MpdtbEPs7y9azF5phZWrjERaWOPdpLbB81cICrgv3W4mvMLbU6RmFQeA5u5HhFEEbHLdWLsMxvHJXxW16Goh+ZqPyny1Az5j79SsCJoWHsBNAxQ9sNF26bWFuMC8v1LY+mmeTadjaqtaNnnXoxWBcde1nNWnzdb68xrOqvu22/MTzuPutujpJ122NvluSb8tTWk85CclDZQwLS0oa2TQpEKacsJy0kSJaQOKJxROKKxhWJ7zS+k9ijsUdim8Y2ZWNUFBP4pMKfOv8onX9WrsI5gd3VVLXtatxcuU0znGUHCUAS2DgrS6mT6hTzrXEjfIZj5Dk2xKkihqm4wKlQfQRqalhUP9UHo3FIPAG/Et44JVLsDDf0JHmB3OEByOwZES8hSAsviGjBdh3ylh6plmMnW4IyAUVJWcE/76vTell1EIaiMBwIAcWBA9GC0lIdKFXQQUsHVVCklN7ojf3+z3JOxYqK2TH555+K6CJJQtRbr9XtDmCnjH0AX9Va8J+liIMvDtRsCk2pEs6hKVexR2g7KuDihwt5a9MfprY0fkLXU9ZmFLpoJolN6GXKWWfZx0tHCocwKJSxC22ItYUEjmBUJHFjfYz1xQxlfaLiZsBExq2IPtbkNbLtOwwuGgjTLkH43mYtSzam7+1Bsr3nm5uExBQUozEh9V7N7uvmwZcqdpm0C6vJW63bZEuXtbrV2zpDzhrpYLBWMnY1mjV7JWFtMio7zbWniWFxvHnWm1yGxXmOPXP+L3YV2ysjnNhaZNeMcHPvuL27BMnVMaujljBAYyje4niH4g2ONyh+4PiB4gOODyjWcKxh1gZBNoJjEY4R/BLhF4IDEQ4QPBoEoyxH4+bxrUsHyxwxQlg0WHXqYifVLmo67cKY/UtaXFxBV26TLjuHrkp8BPJTMij1xQejdkgO24nf7dBOCRcbzQuNOR9Qs64GzzrfQa8It2oFAA6Zrga9xEeq1KHmLUHIiCAWInsg1x/MLqkMsItF8QAAAABJRU5ErkJggg==");
		    background-size: 30px auto;
		  }
		  .starability-result:after {
		    background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAB4CAMAAACZ62E6AAABAlBMVEUAAACZmZmampr2vSObm5v/yiufn5+ampr1viP1viSZmZn2viOZmZmampqampr2viSampqampqcnJz5vyScnJz3wSf/wyn/xiujo6Oqqqr/0C/1vSOampr2viP2viOampr2viP2vST2viOampqampqampr1vyP3viSampr2vyT4vyX3viSbm5ubm5v5wCT8xSmgoKCampqampr3vyb2wiWenp72viOampqZmZmampr2viP2viP1viSampqbm5v2vyT3viObm5v4vyadnZ34wSSbm5v2viSZmZn2viP2vST2viP2viT1viOZmZn2viT2viX3viT3vyb2vyOZmZn1vSOZmZlNN+fKAAAAVHRSTlMA9uz4PQwS8O7r5+fTw4yMelw2MB0dFRELBgbS+/Hfu7uxqKWdg4N7ZmZMPi8pKRgPs0w7Nhb14drKw6Gck21tXkNDIyMZ1rDLycTBtaqVknlfV0sGP8ZwAAADW0lEQVRYw9zWvYqDQBSG4TPDoCAqKhYKQgoVLFaIgZCkiCBBUqVazv3fyu4aEXWdM85Uy779A+LP58AfTQgw73AwtxFiZIwbxMbUfuB3H4b49YNfZrbGodoI52+cm9hH9sbZwwAXOFbo2zjDsSzWxnecuuvaM8MpdtbEPs7y9azF5phZWrjERaWOPdpLbB81cICrgv3W4mvMLbU6RmFQeA5u5HhFEEbHLdWLsMxvHJXxW16Goh+ZqPyny1Az5j79SsCJoWHsBNAxQ9sNF26bWFuMC8v1LY+mmeTadjaqtaNnnXoxWBcde1nNWnzdb68xrOqvu22/MTzuPutujpJ122NvluSb8tTWk85CclDZQwLS0oa2TQpEKacsJy0kSJaQOKJxROKKxhWJ7zS+k9ijsUdim8Y2ZWNUFBP4pMKfOv8onX9WrsI5gd3VVLXtatxcuU0znGUHCUAS2DgrS6mT6hTzrXEjfIZj5Dk2xKkihqm4wKlQfQRqalhUP9UHo3FIPAG/Et44JVLsDDf0JHmB3OEByOwZES8hSAsviGjBdh3ylh6plmMnW4IyAUVJWcE/76vTell1EIaiMBwIAcWBA9GC0lIdKFXQQUsHVVCklN7ojf3+z3JOxYqK2TH555+K6CJJQtRbr9XtDmCnjH0AX9Va8J+liIMvDtRsCk2pEs6hKVexR2g7KuDihwt5a9MfprY0fkLXU9ZmFLpoJolN6GXKWWfZx0tHCocwKJSxC22ItYUEjmBUJHFjfYz1xQxlfaLiZsBExq2IPtbkNbLtOwwuGgjTLkH43mYtSzam7+1Bsr3nm5uExBQUozEh9V7N7uvmwZcqdpm0C6vJW63bZEuXtbrV2zpDzhrpYLBWMnY1mjV7JWFtMio7zbWniWFxvHnWm1yGxXmOPXP+L3YV2ysjnNhaZNeMcHPvuL27BMnVMaujljBAYyje4niH4g2ONyh+4PiB4gOODyjWcKxh1gZBNoJjEY4R/BLhF4IDEQ4QPBoEoyxH4+bxrUsHyxwxQlg0WHXqYifVLmo67cKY/UtaXFxBV26TLjuHrkp8BPJTMij1xQejdkgO24nf7dBOCRcbzQuNOR9Qs64GzzrfQa8It2oFAA6Zrga9xEeq1KHmLUHIiCAWInsg1x/MLqkMsItF8QAAAABJRU5ErkJggg==");
		    background-size: 30px auto;
		  }
		}
		
		.starability-slot {
		  display: block;
		  position: relative;
		  width: 150px;
		  min-height: 60px;
		  padding: 0;
		  border: none;
		}
		
		.starability-slot > input {
		  position: absolute;
		  margin-right: -100%;
		  opacity: 0;
		}
		
		.starability-slot > input:checked ~ label,
		.starability-slot > input:focus ~ label {
		  background-position: 0 0;
		}
		
		.starability-slot > input:checked + label,
		.starability-slot > input:focus + label {
		  background-position: 0 -30px;
		}
		
		.starability-slot > input[disabled]:hover + label {
		  cursor: default;
		}
		
		.starability-slot > input:not([disabled]):hover ~ label {
		  background-position: 0 0;
		}
		
		.starability-slot > input:not([disabled]):hover + label {
		  background-position: 0 -30px;
		}
		
		.starability-slot > input:not([disabled]):hover + label::before {
		  opacity: 1;
		}
		
		.starability-slot > input:focus + label {
		  outline: 1px dotted #999;
		}
		
		.starability-slot .starability-focus-ring {
		  position: absolute;
		  left: 0;
		  width: 100%;
		  height: 30px;
		  outline: 2px dotted #999;
		  pointer-events: none;
		  opacity: 0;
		}
		
		.starability-slot > .input-no-rate:focus ~ .starability-focus-ring {
		  opacity: 1;
		}
		
		.starability-slot > label {
		  position: relative;
		  display: inline-block;
		  float: left;
		  width: 30px;
		  height: 30px;
		  font-size: 0.1em;
		  color: transparent;
		  cursor: pointer;
		  background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAA8CAMAAABGivqtAAAAxlBMVEUAAACZmZn2viTHuJ72viOampqampr1viSampr3vySampqdnZ34wiX1vSSampr1vSOZmZmampr1viT2vSOampr2viT2viSampr2viSampr2vyX4vyWbm5v3vSSdnZ32wSadnZ36wCWcnJyZmZn/wSr/2ySampr2vSP2viSZmZn2vSSZmZn2vST2viSampr2viSbm5ubm5uZmZn1vSSampqbm5v2vSWampqampr3vSf5wiT5vyagoKD/xCmkpKT/yCSZmZn1vSO4V2dEAAAAQHRSTlMA+vsG9fO6uqdgRSIi7+3q39XVqZWVgnJyX09HPDw1NTAwKRkYB+jh3L6+srKijY2Ef2lpYllZUU5CKigWFQ4Oneh1twAAAZlJREFUOMuV0mdzAiEQBmDgWq4YTWIvKRqT2Htv8P//VJCTGfYQZnw/3fJ4tyO76KE0m1b2fZu+U/pu4QGlA7N+Up5PIz9d+cmkbSrSNr9seT3GKeNYIyeO5j16S28exY5suK0U/QKmmeCCX6xs22hJLVkitMImxCvEs8EG3SCRCN/ViFPqnq5epIzZ07QJJvkM9Tkz1xnkmXbfSvR7f4H8AtXBkLGj74mMvjM1+VHZpAZ4LM4K/LBWEI9jwP71v1ZEQ6dyvQMf8A/1pmdZnKce/VH1iIsdte4U8VEtY23xOujxtFpWDgKbfjD2YeEhY0OzfjGeLyO/XfnNpAcmcjDwKOXRfU1IyiTRyEkaiz67pb9oJHJb9vVqKfgjLBPyF5Sq9T0KmSUhQmtiQrJGPHVi0DoSabj31G2gW3buHd0pY85lNdcCk8xlNDPXMuSyNiwl+theIb9C7RLIpKvviYy+M6H8qGwSAp6Is19+GP6KxwnggJ/kq6Jht5rnRQA4z9zyRRaXssvyqp5I6Vutv0vkpJaJtnjpz/8B19ytIayazLoAAAAASUVORK5CYII=");
		  background-repeat: no-repeat;
		  background-position: 0 -30px;
		}
		
		.starability-slot > label::before {
		  content: '';
		  position: absolute;
		  display: block;
		  height: 30px;
		  background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAA8CAMAAABGivqtAAAAxlBMVEUAAACZmZn2viTHuJ72viOampqampr1viSampr3vySampqdnZ34wiX1vSSampr1vSOZmZmampr1viT2vSOampr2viT2viSampr2viSampr2vyX4vyWbm5v3vSSdnZ32wSadnZ36wCWcnJyZmZn/wSr/2ySampr2vSP2viSZmZn2vSSZmZn2vST2viSampr2viSbm5ubm5uZmZn1vSSampqbm5v2vSWampqampr3vSf5wiT5vyagoKD/xCmkpKT/yCSZmZn1vSO4V2dEAAAAQHRSTlMA+vsG9fO6uqdgRSIi7+3q39XVqZWVgnJyX09HPDw1NTAwKRkYB+jh3L6+srKijY2Ef2lpYllZUU5CKigWFQ4Oneh1twAAAZlJREFUOMuV0mdzAiEQBmDgWq4YTWIvKRqT2Htv8P//VJCTGfYQZnw/3fJ4tyO76KE0m1b2fZu+U/pu4QGlA7N+Up5PIz9d+cmkbSrSNr9seT3GKeNYIyeO5j16S28exY5suK0U/QKmmeCCX6xs22hJLVkitMImxCvEs8EG3SCRCN/ViFPqnq5epIzZ07QJJvkM9Tkz1xnkmXbfSvR7f4H8AtXBkLGj74mMvjM1+VHZpAZ4LM4K/LBWEI9jwP71v1ZEQ6dyvQMf8A/1pmdZnKce/VH1iIsdte4U8VEtY23xOujxtFpWDgKbfjD2YeEhY0OzfjGeLyO/XfnNpAcmcjDwKOXRfU1IyiTRyEkaiz67pb9oJHJb9vVqKfgjLBPyF5Sq9T0KmSUhQmtiQrJGPHVi0DoSabj31G2gW3buHd0pY85lNdcCk8xlNDPXMuSyNiwl+theIb9C7RLIpKvviYy+M6H8qGwSAp6Is19+GP6KxwnggJ/kq6Jht5rnRQA4z9zyRRaXssvyqp5I6Vutv0vkpJaJtnjpz/8B19ytIayazLoAAAAASUVORK5CYII=");
		  background-position: 0 30px;
		  pointer-events: none;
		  opacity: 0;
		}
		
		.starability-slot > label:nth-of-type(5)::before {
		  width: 120px;
		  left: -120px;
		}
		
		.starability-slot > label:nth-of-type(4)::before {
		  width: 90px;
		  left: -90px;
		}
		
		.starability-slot > label:nth-of-type(3)::before {
		  width: 60px;
		  left: -60px;
		}
		
		.starability-slot > label:nth-of-type(2)::before {
		  width: 30px;
		  left: -30px;
		}
		
		.starability-slot > label:nth-of-type(1)::before {
		  width: 0px;
		  left: 0px;
		}
		
		@media screen and (-webkit-min-device-pixel-ratio: 2), screen and (min-resolution: 192dpi) {
		  .starability-slot > label {
		    background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAB4CAMAAACZ62E6AAABAlBMVEUAAACZmZmampr2vSObm5v/yiufn5+ampr1viP1viSZmZn2viOZmZmampqampr2viSampqampqcnJz5vyScnJz3wSf/wyn/xiujo6Oqqqr/0C/1vSOampr2viP2viOampr2viP2vST2viOampqampqampr1vyP3viSampr2vyT4vyX3viSbm5ubm5v5wCT8xSmgoKCampqampr3vyb2wiWenp72viOampqZmZmampr2viP2viP1viSampqbm5v2vyT3viObm5v4vyadnZ34wSSbm5v2viSZmZn2viP2vST2viP2viT1viOZmZn2viT2viX3viT3vyb2vyOZmZn1vSOZmZlNN+fKAAAAVHRSTlMA9uz4PQwS8O7r5+fTw4yMelw2MB0dFRELBgbS+/Hfu7uxqKWdg4N7ZmZMPi8pKRgPs0w7Nhb14drKw6Gck21tXkNDIyMZ1rDLycTBtaqVknlfV0sGP8ZwAAADW0lEQVRYw9zWvYqDQBSG4TPDoCAqKhYKQgoVLFaIgZCkiCBBUqVazv3fyu4aEXWdM85Uy779A+LP58AfTQgw73AwtxFiZIwbxMbUfuB3H4b49YNfZrbGodoI52+cm9hH9sbZwwAXOFbo2zjDsSzWxnecuuvaM8MpdtbEPs7y9azF5phZWrjERaWOPdpLbB81cICrgv3W4mvMLbU6RmFQeA5u5HhFEEbHLdWLsMxvHJXxW16Goh+ZqPyny1Az5j79SsCJoWHsBNAxQ9sNF26bWFuMC8v1LY+mmeTadjaqtaNnnXoxWBcde1nNWnzdb68xrOqvu22/MTzuPutujpJ122NvluSb8tTWk85CclDZQwLS0oa2TQpEKacsJy0kSJaQOKJxROKKxhWJ7zS+k9ijsUdim8Y2ZWNUFBP4pMKfOv8onX9WrsI5gd3VVLXtatxcuU0znGUHCUAS2DgrS6mT6hTzrXEjfIZj5Dk2xKkihqm4wKlQfQRqalhUP9UHo3FIPAG/Et44JVLsDDf0JHmB3OEByOwZES8hSAsviGjBdh3ylh6plmMnW4IyAUVJWcE/76vTell1EIaiMBwIAcWBA9GC0lIdKFXQQUsHVVCklN7ojf3+z3JOxYqK2TH555+K6CJJQtRbr9XtDmCnjH0AX9Va8J+liIMvDtRsCk2pEs6hKVexR2g7KuDihwt5a9MfprY0fkLXU9ZmFLpoJolN6GXKWWfZx0tHCocwKJSxC22ItYUEjmBUJHFjfYz1xQxlfaLiZsBExq2IPtbkNbLtOwwuGgjTLkH43mYtSzam7+1Bsr3nm5uExBQUozEh9V7N7uvmwZcqdpm0C6vJW63bZEuXtbrV2zpDzhrpYLBWMnY1mjV7JWFtMio7zbWniWFxvHnWm1yGxXmOPXP+L3YV2ysjnNhaZNeMcHPvuL27BMnVMaujljBAYyje4niH4g2ONyh+4PiB4gOODyjWcKxh1gZBNoJjEY4R/BLhF4IDEQ4QPBoEoyxH4+bxrUsHyxwxQlg0WHXqYifVLmo67cKY/UtaXFxBV26TLjuHrkp8BPJTMij1xQejdkgO24nf7dBOCRcbzQuNOR9Qs64GzzrfQa8It2oFAA6Zrga9xEeq1KHmLUHIiCAWInsg1x/MLqkMsItF8QAAAABJRU5ErkJggg==");
		    background-size: 30px auto;
		  }
		}
		
		@media screen and (-ms-high-contrast: active) {
		  .starability-slot {
		    width: auto;
		  }
		  .starability-slot > input {
		    position: static;
		    margin-right: 0;
		    opacity: 1;
		  }
		  .starability-slot .input-no-rate {
		    display: none;
		  }
		  .starability-slot > label {
		    display: inline;
		    float: none;
		    width: auto;
		    height: auto;
		    font-size: 1em;
		    color: inherit;
		    background: none;
		  }
		  .starability-slot > label::before, .starability-slot > label::after {
		    display: none;
		  }
		}
		
		.starability-slot > input:checked ~ label,
		.starability-slot > input:hover ~ label,
		.starability-slot > input:focus ~ label {
		  -webkit-transition: background-position .7s;
		  transition: background-position .7s;
		}
</style>

</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<div class="container">
        <div class="row text-white" style="border-bottom: 1px solid lightgray;">
            <div class="col-2" style="padding:3%; font-size: 150%; font-family: 'Jua', sans-serif;">
                회원찾기
            </div>
        </div>

        <div class="row">
            <div class="col-2 text-white" style="border-right: 1px solid lightgray; font-family: 'Jua', sans-serif;">
                <br>
                <div style="border-bottom: 1px solid lightgray; padding-bottom: 5.5%;">
                    클라이언트
                </div>
            </div>
            <div class="col-10 text-white" style="font-family: 'Jua', sans-serif;">
                <br>
                <div class="row">
                    <div class="col-8" style="margin-left:5%;">
                        &emsp;<b>user01(닉네임)</b>&emsp;<a class="badge badge-info"
                            style="">개인</a><br>
                        &emsp;<i class="far fa-address-card"></i>&nbsp;신원인증
                        &emsp;<i class="fas fa-phone-alt"></i>&nbsp;연락처 등록
                    </div>
                    <div class="col-2" style="margin:0 auto; margin-right: 5%;">
                        <button class="btn-lg btn-info" style="float:right;" type="button"  data-toggle="modal" data-target="#exampleModal">신고</button>
                    </div>
					  <!-- 신고 모달 -->
					  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content modal-xl text-dark">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">신고</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					        <form action="clientReport.do" method="post">
					          <div class="form-group">
					            <label for="recipient-name" class="col-form-label">클라이언트</label>
					            <input type="text" class="form-control" id="recipient-name" value="${epList[0].memNick }" readonly>
					            <input type="hidden" name="reportCid" value="${epList[0].memId }">
					            <input type="hidden" name="pId" value="${loginUser.memId }">
					          </div>
					          <div class="form-group">
					            <label for="message-text" class="col-form-label">신고 내용</label>
					            <textarea class="form-control" name="reportContent" id="message-text" placeholder="신고 내용을 입력하세요. 허위 사실을 입력할 시 제재를 받으실 수 있습니다."></textarea>
					          </div>
					          <div class="modal-footer">
					        <button type="button" class="btn btn-lg btn-secondary" data-dismiss="modal">취소</button>
					        <button type="submit" class="btn btn-lg btn-primary">신고</button>
					      </div>
					        </form>
					      </div>
					      
					    </div>
					  </div>
					</div>
		
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-2 text-white" style="border-right: 1px solid lightgray; font-family: 'Jua', sans-serif;">
                <br>
                <div style="padding-bottom: 5.5%;">
                    <div class="image-container">
                    	<c:if test="${!empty fc[0].profileImg }">
                        <img src="${contextPath }/resources/proImg/${fc[0].profileImg}" style="object-fit: cover;">
	                    </c:if>
	                    <c:if test="${empty fc[0].profileImg }">
	                        <img src="${contextPath }/resources/proImg/user1.png" style="object-fit: cover;">
	                    </c:if>
                    </div>
                    <hr style=" margin:0px auto; margin-top:5%; margin-bottom:10%;">
                    <div>
                        <p id="clientInfo" style="cursor:pointer;">클라이언트 정보</p>
                        <p id="projectHistory" style="cursor:pointer;">프로젝트 히스토리</p>
                        
                        <p id="clientEvaluate" style="cursor:pointer;">평가<i style="float: right; margin-right: 5%;" class="fas fa-angle-down"></i></p>
                        <div id="subClientEva" style="display:none; margin-left: 5%;">
                            <p id="clientComment" style="cursor:pointer;">평가 조회</p>
                            <p id="insertCComment" style="cursor:pointer;">평가 등록</p>
                        </div>
                    </div>
                    <c:url var="cDetail" value="cDetail.do">
                    	<c:param name="cId" value="${epList[0].memId }"/>
                    	<%-- <c:param name="page" value="${pi.currentPage }"/> --%>
                    </c:url>
                    <c:url var="cProjectHistory" value="cProjectHistory.do">
                    	<c:param name="cId" value="${epList[0].memId }"/>
                    </c:url>
                    <c:url var="cEvalSelect" value="cEvalSelect.do">
                    	<c:param name="cId" value="${epList[0].memId }"/>
                    	<c:param name="msg" value="1"/>
                    </c:url>
                    <c:url var="cEvalInsert" value="cEvalInsert.do">
                    	<c:param name="cId" value="${epList[0].memId }"/>
                    	<c:choose>
                    		<c:when test="${!empty loginUser }">
	                    		<c:param name="pId" value="${loginUser.memId }"/>
                    		</c:when>
                    		<c:otherwise>
                    			<c:param name="pId" value="0"/>
                    		</c:otherwise>
                    	</c:choose>
                    </c:url>
                    <script>
                        $("#clientInfo").on("click", function(){
                            location.href="${cDetail }";
                        }).on("mouseenter", function(){
                            
                        });

                        $("#projectHistory").on("click", function(){
                            location.href="${cProjectHistory }";
                        });

                        $("#clientEvaluate").click(function() {
                            $("#subClientEva").toggle();
                        });

                        $("#clientComment").on("click", function(){
                            location.href="${cEvalSelect }";
                        });

                        $("#insertCComment").on("click", function(){
                            location.href="${cEvalInsert }";
                        });
                    </script>
                </div>
            </div>
            <div class="col-10 text-white" style="font-family: 'Jua', sans-serif;">
                <form id="insertForm" name="insertForm" action="cEvalInsert2.do" method="post">
                <div class="userBoard">
                    &emsp;
                    <input type="hidden" value="선택한 회원 ID">

                    <div class="row"
                        style="margin-left:3%; margin-right:3%;border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
                        <div class="point col-12" style="margin-left:2%;">
                            <h4>클라이언트 평가</h4>
                            <input type="hidden" name="pId" value="${loginUser.memId }">
                            <input type="hidden" name="cId" value="${epList[0].memId }">
                            <div>
                                <table style="width:100%;">
                                    <tr>
                                        <td colspan="4">
                                            <div style="margin-top:5%; margin-left:3%;">
                                               	 프로젝트&emsp;
                                            <div class="btn-group dropdown" style="margin-left: 1%;">
                                                <button id="projectName" class="btn btn-outline-light dropdown-toggle" type="button"
                                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">&emsp;&emsp;&emsp;&emsp;&emsp;</button>
                                                <div id="projectList" class="dropdown-menu" style="max-height: 400%; overflow-y: auto;">
                                                    <!-- <a id="mini" class="dropdown-item">miniProject</a>
                                                    <a id="semi" class="dropdown-item">semiProject</a>
                                                    <a id="final" class="dropdown-item">finalProject</a> -->
                                                    
                                                    <c:forEach var="pList" items="${epList }" varStatus="status">
                                                    	<a id="pro${status.index }" class="dropdown-item">${pList.proName }</a>
                                                    	<input id="proId${status.count }" name="proId" type="hidden" value="${pList.proId }">
                                                    
                                                    	<script>
                                                    		var proId=${pList.proId};
                                                    		
                                                    		$(function(){
                                                    			$("#pro${status.index}").on("click", function () {
                                                    				$("#projectName").text($(this).text());
                                                    				console.log(${pList.proId});
                                                    			})
                                                    		})
                                                    	</script>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                        </td> 
                                    </tr>
                                    <tr>
                                        <td style="width:13%;">
                                            <div style="margin-top:5%; margin-left:15%;">
                                                	&nbsp;&nbsp;평가 점수&emsp;
                                            </div>
                                        </td>
                                        <td>
                                        	<div style="width:auto">
                                            <fieldset class="starability-slot" style="margin-top:5%;">
                                            	<input type="radio" id="no-rate-slot" class="input-no-rate" name="total" value="0" checked aria-label="No rating." />
										        <input type="radio" id="total5" name="total" value="1" />
										        <label for="total5" title="Amazing">5 stars</label>
										
										        <input type="radio" id="total4" name="total" value="2" />
										        <label for="total4" title="Very good">4 stars</label>
										
										        <input type="radio" id="total3" name="total" value="3" />
										        <label for="total3" title="Average">3 stars</label>
										
										        <input type="radio" id="total2" name="total" value="4" />
										        <label for="total2" title="Not good">2 stars</label>
										
										        <input type="radio" id="total1" name="total" value="5" />
										        <label for="total1" title="Terrible">1 star</label>
										      </fieldset>
										      </div>
                                        </td>
                                        <script>
                                            // 별점 스크립트
                                        </script>
                                    </tr>
                                    <tr>
                                    	<td colspan="2">
                                    		<div style="width:90%; margin-left: 2%;">
				                                <div class="form-group shadow-textarea" style="width:60%;">
				                                    <label for="ratingContent" style="margin-left: 3%;">평가 내용</label>
				                                    <textarea style="margin-left: 15%;" class="form-control z-depth-1" id="ratingContent" name="eContent" rows="3" placeholder="클라이언트를 평가해주세요..."></textarea>
				                                    <br>
				                                    <span style="color:#aaa; margin-left: 15%;" id="counter">(0 / 최대 200자)</span>
				                                  </div>
				                                  <script>
				                                  $("#ratingContent").keyup(function (e){
				                                	    var content = $(this).val();
				                                	    $('#counter').html("("+content.length+" / 최대 200자)");    //글자수 실시간 카운팅
				
				                                	    if (content.length > 200){
				                                	        alert("최대 200자까지 입력 가능합니다.");
				                                	        $(this).val(content.substring(0, 200));
				                                	        $('#counter').html("(200 / 최대 200자)");
				                                	    }
				                                	});
				                                  </script>
				                            </div>
                                    	</td>
                                    </tr>
                                </table>
                            </div>
                            <!-- <div style="width:90%; margin-left: 2%;">
                                <div class="form-group shadow-textarea" style="width:60%;">
                                    <label for="ratingContent" style="margin-left: 3%;">평가 내용</label>
                                    <textarea style="margin-left: 15%;" class="form-control z-depth-1" id="ratingContent" name="eContent" rows="3" placeholder="클라이언트를 평가해주세요..."></textarea>
                                    <br>
                                    <span style="color:#aaa; margin-left: 15%;" id="counter">(0 / 최대 200자)</span>
                                  </div>
                                  <script>
                                  $("#ratingContent").keyup(function (e){
                                	    var content = $(this).val();
                                	    $('#counter').html("("+content.length+" / 최대 200자)");    //글자수 실시간 카운팅

                                	    if (content.length > 200){
                                	        alert("최대 200자까지 입력 가능합니다.");
                                	        $(this).val(content.substring(0, 200));
                                	        $('#counter').html("(200 / 최대 200자)");
                                	    }
                                	});
                                  </script>
                            </div> -->
                        </div>
                    </div>
                    <div class="point col-12" style="margin-left:2%;">
                        <h4 style="margin-left: 3%;">세부 평가</h4>
                        <table style="margin-left: 6%;">
                            <tr>
                                <td>
                                    <p>전문성</p>
                                </td>
                                <td>
                                    <fieldset class="starability-slot" style="margin-top:10%;">
                                    	<input type="radio" id="no-rate-slot" class="input-no-rate" name="professional" value="0" checked aria-label="No rating." />
								        <input type="radio" id="professional5" name="professional" value="1" />
								        <label for="professional5" title="Amazing">5 active</label>
								
								        <input type="radio" id="professional4" name="professional" value="2" />
								        <label for="professional4" title="Very good">4 stars</label>
								
								        <input type="radio" id="professional3" name="professional" value="3" />
								        <label for="professional3" title="Average">3 stars</label>
								
								        <input type="radio" id="professional2" name="professional" value="4" />
								        <label for="professional2" title="Not good">2 stars</label>
								
								        <input type="radio" id="professional1" name="professional" value="5" />
								        <label for="professional1" title="Terrible">1 star</label>
								      </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:40%;">
                                    <p>적극성</p>
                                </td>
                                <td>
                                    <fieldset class="starability-slot" style="margin-top:10%;">
                                    	<input type="radio" id="no-rate-slot" class="input-no-rate" name="active" value="0" checked aria-label="No rating." />
								        <input type="radio" id="active5" name="rating" value="1" />
								        <label for="active5" title="Amazing">5 active</label>
								
								        <input type="radio" id="active4" name="active" value="2" />
								        <label for="active4" title="Very good">4 stars</label>
								
								        <input type="radio" id="active3" name="active" value="3" />
								        <label for="active3" title="Average">3 stars</label>
								
								        <input type="radio" id="active2" name="active" value="4" />
								        <label for="active2" title="Not good">2 stars</label>
								
								        <input type="radio" id="active1" name="active" value="5" />
								        <label for="active1" title="Terrible">1 star</label>
								      </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:40%;">
                                    <p>일정준수</p>
                                </td>
                                <td>
                                    <fieldset class="starability-slot" style="margin-top:10%;">
                                    	<input type="radio" id="no-rate-slot" class="input-no-rate" name="schedule" value="0" checked aria-label="No rating." />
								        <input type="radio" id="schedule5" name="schedule" value="1" />
								        <label for="schedule5" title="Amazing">5 stars</label>
								
								        <input type="radio" id="schedule4" name="schedule" value="2" />
								        <label for="schedule4" title="Very good">4 stars</label>
								
								        <input type="radio" id="schedule3" name="schedule" value="3" />
								        <label for="schedule3" title="Average">3 stars</label>
								
								        <input type="radio" id="schedule2" name="schedule" value="4" />
								        <label for="schedule2" title="Not good">2 stars</label>
								
								        <input type="radio" id="schedule1" name="schedule" value="5" />
								        <label for="schedule1" title="Terrible">1 star</label>
								      </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:40%;">
                                    <p>의사소통</p>
                                </td>
                                <td>
                                    <fieldset class="starability-slot" style="margin-top:10%;">
                                    	<input type="radio" id="no-rate-slot" class="input-no-rate" name="communication" value="0" checked aria-label="No rating." />
								        <input type="radio" id="communication5" name="communication" value="1" />
								        <label for="communication5" title="Amazing">5 stars</label>
								
								        <input type="radio" id="communication4" name="communication" value="2" />
								        <label for="communication4" title="Very good">4 stars</label>
								
								        <input type="radio" id="communication3" name="communication" value="3" />
								        <label for="communication3" title="Average">3 stars</label>
								
								        <input type="radio" id="communication2" name="communication" value="4" />
								        <label for="communication2" title="Not good">2 stars</label>
								
								        <input type="radio" id="communication1" name="communication" value="5" />
								        <label for="communication1" title="Terrible">1 star</label>
								      </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:40%;">
                                    <p>만족도</p>
                                </td>
                                <td>
                                    <fieldset class="starability-slot" style="margin-top:10%;">
                                    	<input type="radio" id="no-rate-slot" class="input-no-rate" name="satisfaction" value="0" checked aria-label="No rating." />
								        <input type="radio" id="satisfaction5" name="satisfaction" value="5" />
								        <label for="satisfaction5" title="Amazing">5 stars</label>
								
								        <input type="radio" id="satisfaction4" name="satisfaction" value="4" />
								        <label for="satisfaction4" title="Very good">4 stars</label>
								
								        <input type="radio" id="satisfaction3" name="satisfaction" value="3" />
								        <label for="satisfaction3" title="Average">3 stars</label>
								
								        <input type="radio" id="satisfaction2" name="satisfaction" value="2" />
								        <label for="satisfaction2" title="Not good">2 stars</label>
								
								        <input type="radio" id="satisfaction1" name="satisfaction" value="1" />
								        <label for="satisfaction1" title="Terrible">1 star</label>
								      </fieldset>
                                </td>
                            </tr>
                        </table>
                        
                        <div style="float:right; margin-right: 8%; margin-top:2%; margin-bottom: 5%;">
                            <button class="btn btn-light" type="button">취소하기</button>&nbsp;
                            <button id="insertBtn" class="btn btn-info" type="submit">등록하기</button>
                        </div>
                    </div>
                </div>  
            </form>
            </div>
        </div>
    </div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>