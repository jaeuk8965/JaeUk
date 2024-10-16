package com.popup.project.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.popup.project.member.dto.UserDTO;

@Mapper
public interface UserMapper {

    UserDTO getUserByUsername(String username);

    int IdCheck(@Param("userId") String userId);

    int NickCheck(String nick);

    int EmailCheck(String email);

    int PhoneCheck(String phone);

    String FindId(@Param("name") String name, @Param("phone") String phone);

    int checkUserNameAndEmail(@Param("userName") String userName, @Param("userEmail") String userEmail);

    int updatePasswordByEmail(@Param("email") String email, @Param("password") String password);

    String getPasswordByUserId(@Param("userId") String userId);

    int updateUserInfo(UserDTO user);

    int register(UserDTO dto);

    int deleteUserById(String userId);

    List<UserDTO> AdmingetAllUsers();

    // 관리자 UserList에서 검색
    List<UserDTO> searchUsersByIdOrNickname(@Param("query") String query);

    // 소셜 로그인 사용자를 조회하는 메서드
    UserDTO findBySocialIdAndProvider(@Param("socialId") String socialId, @Param("provider") String provider);

    // 소셜 로그인 사용자 provider 조회 메서드
    UserDTO findSocialProvider(@Param("socialProvider") String socialProvider);
    
    // 소셜 로그인 사용자를 등록하는 메서드
    int saveSocialUser(UserDTO user);

    // 소셜 로그인 사용자의 정보를 업데이트하는 메서드
    int updateUserBySocialIdAndProvider(UserDTO user);
    
    void updateFailedAttempts(@Param("failedAttempts") int failedAttempts, @Param("userId") String userId);

    void lockAccount(@Param("userId") String userId);

    void unlockAccount(@Param("userId") String userId);

    // Admin 권한 확인 메서드
    String getUserAuthority(@Param("userId") String userId);
    
    int getFailedAttempts(@Param("userId") String userId);
    
    public void unlockAccountByEmail(String email);

    public void resetFailedAttemptsByEmail(@Param("email") String email);
    
}