<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class AuthController extends Controller
{
  public function showLogin()
    {
        return view('auth.login');
    }

    public function login(Request $request)
    {
        $credentials = $request->validate([
            'email' => [
                'required',
                'email',
            ],
            'password' => [
                'required',
                'string',
            ],
        ]);

        $response = Http::acceptJson()
            ->post(
                config('services.api_internal_url') . '/api/login',
                $credentials
            );

        if ($response->failed()) {
            return back()
                ->withInput($request->only('email'))
                ->withErrors([
                    'email' => 'Las credenciales son incorrectas.',
                ]);
        }

        $data = $response->json();

        $request->session()->put([
            'api_token' => $data['token'],
            'user' => $data['user'],
        ]);

        return redirect()->route('dashboard');
    }

    public function logout(Request $request)
    {
        $token = $request->session()->get('api_token');

        if ($token) {
            Http::withToken($token)
                ->post(
                    config('services.api_internal_url') . '/api/logout'
                );
        }

        $request->session()->forget([
            'api_token',
            'user',
        ]);

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('login');
    }
}
