                                                                   //author rhythmicankur
                                                                  //god_is_almighty
#pragma GCC optimize("O3")
#pragma GCC target ("sse4")
#include<bits/stdc++.h>
#define f 		first
#define s 		second
#define int     long long
#define ll 		long long
#define ld 		long double
#define pb 		push_back
#define eb 		emplace_back
#define mk 		make_pair
#define vi 		vector<int>
#define pii 		pair<int,int>
#define vpi 		vector<pii>
#define REP(i,n) for (int i = 1; i <= n; i++)
#define trav(a, x)      for(auto& a : x)
#define all(x)          x.begin(), x.end()
#define fill(a,val)	memset(a,val,sizeof(a))
#define 	PI acos(-1)
#define coud(a,b) cout<<fixed << setprecision((b)) << (a)
#define M1 	998244353
#define M2 	1000000007
const ll LL_INF = 0x3f3f3f3f3f3f3f3f;

template<typename T> T gcd(T a,T b) { if(a==0) return b; return gcd(b%a,a); } 
#define test4(x,y,z,a) 		    cerr<<#x<<":" <<x<<" | "<<#y<<": "<<y<<" | "<<#z<<": "<<z<<"  |  "<<#a<<": "<<a<<endl;
#define test1(x)                cerr<<#x<<": "<<x<<endl
#define test2(x, y)             cerr<<#x<<": "<<x<<" | "<<#y<<": "<<y<<endl
#define test3(x, y, z)          cerr<<#x<<":" <<x<<" | "<<#y<<": "<<y<<" | "<<#z<<": "<<z<<endl
ll power(ll a,ll b,ll m=M2){ll answer=1;while(b){if(b&1)answer=(answer*a)%m;b/=2;a=(a*a)%m;}return answer;}
using namespace std;
void ctrl(){cout<<"Control"<<endl;}
int make_num(string p){stringstream geek(p); int x = 0; geek >> x;return x;}
string make_str(int x){ostringstream str1; str1 << x; string geek = str1.str(); return geek;}
const int N=2e5+5;
int final_height;
int R,G;
signed main()
{	ios::sync_with_stdio(0);
	cin.tie(0); 
	cin.exceptions(cin.failbit);
    
    
    cin>>R>>G;
    int fh;
    int h;
    for(int i=0;i<1000;i++)
    {
        int x = i*(i+1);
        if(x/2<=R+G)
        h=i;
    }
    final_height=h;
    test1(h);
    if(G>R)
    swap(G,R);

    int dp[R+5][2]={0};
    //test4(dp[1][0],dp[1][1],dp[2][0],dp[2][1]);
    if(R>0)
    dp[R-1][0]=1;
    if(G>0)
    dp[R][0]=1;

    for(int i=2;i<=final_height;i++)
    {
        for(int j=0;j<=R;j++)
        {
            dp[j][1]=0;
            if(j+i<=R)
            dp[j][1]+=dp[j+i][0];
            
            int used_block = (i*(i+1))/2;
            int used_red = R-j;
            int green_rem = G-(used_block-used_red);
            if(green_rem<=G&&green_rem>=0)
                dp[j][1]+=dp[j][0];

                dp[j][1]%=M2;
            
        }

        for(int j=0;j<=R;j++)
        {
            dp[j][0]=dp[j][1];
        }
    }
    int s=0;
    for(int j=0;j<=R;j++)
    {
        s+=dp[j][0];
        s%=M2;
    }
    cout<<s;
    
    

return 0;
}